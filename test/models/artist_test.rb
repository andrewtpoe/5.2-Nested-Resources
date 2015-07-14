require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  def setup
    @artist = artists(:one)
  end

  test "fixture works as expected" do
    assert @artist.valid?
  end

  test "must have name" do
    @artist.name = nil
    refute @artist.valid?
    assert @artist.errors.keys.include?(:name)
  end

  test "has many songs" do
    assert_respond_to @artist, :songs
    assert_instance_of Song, @artist.songs.new
  end

end
