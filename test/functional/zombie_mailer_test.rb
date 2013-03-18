require 'test_helper'

class ZombieMailerTest < ActionMailer::TestCase
  test "decomp_change" do
    mail = ZombieMailer.decomp_change
    assert_equal "Decomp change", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "lost_brain" do
    mail = ZombieMailer.lost_brain
    assert_equal "Lost brain", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
