require 'test_helper'

class SongTest < ActiveSupport::TestCase
  def setup
    @song = songs(:one)
  end

  test "fixture works as expected" do
    assert @song .valid?
  end

  test "must have title" do
    @song.title = nil
    refute @song.valid?
    assert @song.errors.keys.include?(:title)
  end

  test "belongs to an artist" do
    assert_respond_to @song, :artist
    @song.artist = artists(:one)
    assert_instance_of Artist, @song.artist
  end

  test "belongs to an album" do
    assert_respond_to @song, :album
    @song.album = albums(:one)
    assert_instance_of Album, @song.album
  end


end
