require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  def setup
    @album = albums(:one)
  end

  test 'GET #new' do
    get :new
    assert_response :success
    assert_instance_of Album, assigns(:album)
  end

  class AlbumsCreate < AlbumsControllerTest
    test 'creates with valid attributes and redirects' do
      assert_difference('Album.count', 1) do
        post :create, album: { title: 'american idiot' }
      end
      assert_redirected_to album_path(assigns(:album))
    end

    test 'renders new with INvalid attributes' do
      assert_no_difference('Album.count') do
        post :create, album: { title: '' }
      end
      assert_template :new
    end
  end

  test 'GET #edit' do
    get :edit, id: @album
    assert_response :success
    assert_equal @album, assigns(:album)
  end

  class AlbumsUpdate < AlbumsControllerTest
    test 'updates successfully with valid attributes and redirects' do
      old_title = @album.title
      new_title = 'This is a test title'
      post :update, id: @album, album: { title: new_title }
      @album.reload
      refute @album.title == old_title
      assert @album.title == new_title
      assert_redirected_to album_path(@album)
    end

    test 'renders edit with INvalid attributes' do
      old_title = @album.title
      post :update, id: @album, album: { title: '' }
      @album.reload
      assert @album.title == old_title
      assert_template :edit
    end
  end

  test 'DELETE #destroy' do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end
    assert_redirected_to album_path
  end

end
