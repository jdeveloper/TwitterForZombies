require 'test_helper'
require 'shoulda'

class ZombieTest < ActiveSupport::TestCase
  def setup
    @zombie = zombies(:ash)
  end
  
  should validate_presence_of(:name)
  should validate_presence_of(:graveyard)
  should have_many(:tweets)
  
  test "invalid without a name" do
    @zombie = Zombie.new
    assert !@zombie.valid?, "Name is not being validated"
  end
  
  test "valid with all attributes" do    
    assert @zombie.valid?, "Zombie was not valid"
  end
  
  test "can generate avatar_url" do
   assert_equal "http://zombietar.com/#{@zombie.id}.jpg", @zombie.avatar_url
  end
  
  test "should contain only tweets that belong to @zombie" do
    assert @zombie.tweets.all? do |tweet|
      tweet.zombie == @zombie
    end
  end
end
