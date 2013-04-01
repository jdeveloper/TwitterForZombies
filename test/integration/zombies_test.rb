require 'test_helper'

class ZombiesTest < ActionDispatch::IntegrationTest
  fixtures :all
  
  test "Anyone can view zombie information" do
    zombie = zombies(:ash)
    visit zombie_url(zombie)
    
    assert_equal zombie_path(zombie), current_path
    within("h1") do
      assert has_content?(zombie.name)
    end
  end
  
  test "Navigation is aviable to the zombie" do
    zombie = zombies(:ash)
    tweet = tweets(:ash_1)    
    visit zombies_url
   
    within "h1" do
      assert has_content?("Listing zombies")
    end
    
    within("#zombie_#{zombie.id}") do
      click_link zombie.name
      assert_equal zombie_path(zombie), current_path
    end
  end
end
