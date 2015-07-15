class AlbumsController < ApplicationController

  def new
    if params['artist_id']
      @artist = get_artist
    end
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      @artist = get_artist
      @artist_album = ArtistAlbum.create(artist: @artist, album: @album)
      redirect_to artist_path(@artist.id)
    else
      render :new
    end
  end

  def edit
    @album = get_album
  end

  def update
    @album = get_album
    joint = ArtistAlbum.find_by(album_id: @album.id)
    if @album.update_attributes(album_params)
      redirect_to artist_path(joint.artist_id)
    else
      render :edit
    end
  end

  def destroy
    @album = get_album
    joint = ArtistAlbum.find_by(album_id: @album.id)
    artist_id = joint.artist_id
    joint.destroy
    @album.destroy
    redirect_to artist_path(artist_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :artwork)
  end

  def get_album
    Album.find(params[:id])
  end

  def get_artist
    Artist.find(params['artist_id'])
  end
end
