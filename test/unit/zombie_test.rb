require 'test_helper'

class ZombieTest < ActiveSupport::TestCase
  test "invalid without a name" do
    zombie = Zombie.new
    assert !zombie.valid?, "Name is not being validated"
  end
  
  test "valid with all attributes" do
    zombie = zombies(:ash)
    
    assert zombie.valid?, "Zombie was not valid"
  end
  
  test "invalid name gives error message" do
    zombie = zombies(:ash)
    zombie.name = nil
    zombie.valid?
    
    assert_match /can't be blank/, zombie.errors[:name].join
  end
  
  test "can generate avatar_url" do
    zombie = zombies(:ash)
    
    assert_equal "http://zombietar.com/#{zombie.id}.jpg", zombie.avatar_url
  end
  
  test "should responde to tweets" do
    zombie = zombies(:ash)
    
    assert_respond_to zombie, :tweets
  end
  
  test "should contain tweets" do
    zombie = zombies(:ash)
    
    assert_equal [tweets(:ash_2), tweets(:ash_1)], zombie.tweets
  end
  
  test "should contain only tweets that belong to zombie" do
    zombie = zombies(:ash)
    
    assert zombie.tweets.all? do |tweet|
      tweet.zombie == zombie
    end
  end
end
