require 'test_helper'

class ArtistAlbumTest < ActiveSupport::TestCase
  def setup
    @artist_album = artist_albums(:one)
  end

  test "fixture works as expected" do
    assert @artist_album.valid?
  end

  test "belongs to artist" do
    assert_respond_to @artist_album, :artist
    @artist_album.artist = artists(:one)
    assert_instance_of Artist, @artist_album.artist
  end

  test "belongs to album" do
  assert_respond_to @artist_album, :album
  @artist_album.album = albums(:one)
  assert_instance_of Album, @artist_album.album
  end

end
