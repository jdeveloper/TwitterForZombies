require 'spec_helper'

describe Zombie do
  it "is invalid if no name is given" do
    zombie = Zombie.new
    zombie.should_not be_valid
  end
end