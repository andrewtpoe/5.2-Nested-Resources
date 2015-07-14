require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  def setup
    @album = albums(:one)
  end

  test "fixture works as expected" do
    assert @album.valid?
  end

  test "must have title" do
    @album.title = nil
    refute @album.valid?
    assert @album.errors.keys.include?(:title)
  end

  test "has many songs" do
    assert_respond_to @album, :songs
    assert_instance_of Song, @album.songs.new
  end

end
