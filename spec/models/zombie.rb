require 'spec_helper'

describe Zombie do
  it "is invalid if no name is given" do
    zombie = Zombie.new
    zombie.should_not be_valid
  end
  
  it "includes tweets" do
    tweet1 = Tweet.new(status: 'Uuuuuuhhhh!')
    tweet2 = Tweet.new(status: "Arrrrrg")
    zombie = Zombie.new(name: "Ash", tweets: [tweet1, tweet2])
    
    zombie.tweets.should include(tweet1)
    zombie.tweets.should include(tweet2)
  end
  
  it "starts with two weapons" do
    zombie = Zombie.new(name: "Ash")
    
    zombie.should have(2).weapons
  end
  
  it "changes the number of zombies" do
    zombie = Zombie.new(name: "Ash", graveyard: "Trotelling")
    expect {zombie.save}.to change {Zombie.count}.by(1)
  end
  
  it "raises an error if saved without name and graveyard" do
    zombie = Zombie.new
    
    expect {zombie.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end