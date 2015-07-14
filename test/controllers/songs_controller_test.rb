require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  def setup
    @song = songs(:one)
    @artist = artists(:one)
    @album = albums(:one)
  end

  test 'GET #new' do
    get :new
    assert_response :success
    assert_instance_of Song, assigns(:song)
  end

  class SongsCreate < SongsControllerTest
    test 'creates with valid attributes and redirects' do
      assert_difference('Song.count', 1) do
        post :create, song: { title: 'american idiot', artist_id: @artist.id, album_id: @album.id }
      end
      assert_redirected_to song_path(assigns(:song))
    end

    test 'renders new with INvalid attributes' do
      assert_no_difference('Song.count') do
        post :create, song: { title: '' }
      end
      assert_template :new
    end
  end

  test 'GET #edit' do
    get :edit, id: @song
    assert_response :success
    assert_equal @song, assigns(:song)
  end

  class SongsUpdate < SongsControllerTest
    test 'updates successfully with valid attributes and redirects' do
      old_title = @song.title
      new_title = 'This is a test title'
      post :update, id: @song, song: { title: new_title }
      @song.reload
      refute @song.title == old_title
      assert @song.title == new_title
      assert_redirected_to song_path(@song)
    end

    test 'renders edit with INvalid attributes' do
      old_title = @song.title
      post :update, id: @song, song: { title: '' }
      @song.reload
      assert @song.title == old_title
      assert_template :edit
    end
  end

  test 'DELETE #destroy' do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end
    assert_redirected_to song_path
  end

end
