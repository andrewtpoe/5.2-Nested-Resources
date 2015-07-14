require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase

  def setup
    @artist = artists(:one)
    @artist2 = artists(:two)
  end

  test 'GET #index' do
    get :index
    assert_response :success
    assert_equal [@artist, @artist2], assigns(:artists)
  end

  test 'GET #new' do
    get :new
    assert_response :success
    assert_instance_of Artist, assigns(:artist)
  end

  class ArtistsCreate < ArtistsControllerTest
    test 'creates with valid attributes and redirects' do
      assert_difference('Artist.count', 1) do
        post :create, artist: { name: 'greenday' }
      end
      assert_redirected_to artist_path(assigns(:artist))
    end

    test 'renders new with INvalid attributes' do
      assert_no_difference('Artist.count') do
        post :create, artist: { name: '' }
      end
      assert_template :new
    end
  end

  test 'GET #show' do
    get :show, id: @artist
    assert_response :success
    assert_equal @artist, assigns(:artist)
  end

  test 'GET #edit' do
    get :edit, id: @artist
    assert_response :success
    assert_equal @artist, assigns(:artist)
  end

  class ArtistsUpdate < ArtistsControllerTest
    test 'updates successfully with valid attributes and redirects' do
      old_name = @artist.name
      old_bio = @artist.bio
      new_name = "This is a test name"
      new_bio = "This is a test bio"
      patch :update, id: @artist, artist: { name: new_name, bio: new_bio }
      @artist.reload
      refute @artist.name == old_name
      refute @artist.bio == old_bio
      assert @artist.name == new_name
      assert @artist.bio == new_bio
      assert_redirected_to artist_path(@artist)
    end

    test 'renders new with INvalid attributes' do
      old_name = @artist.name
      new_name = ''
      patch :update, id: @artist, artist: { name: new_name }
      @artist.reload
      assert @artist.name == old_name
      refute @artist.name == new_name
      assert_template :edit

    end
  end

  test 'DELETE #destroy' do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end
    assert_redirected_to artist_path
  end

end
