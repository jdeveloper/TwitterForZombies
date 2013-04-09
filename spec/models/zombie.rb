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
end