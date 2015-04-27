require 'test_helper'

class UserTest < ActiveSupport::TestCase

<<<<<<< HEAD
  test "valid user saved" do
    original_user_total = User.count
    u = User.new(name: "Don", email: "donald@example.com", password: "12341234", password_confirmation: "12341234")
    u.save
    assert_equal (original_user_total + 1), User.count
  end

  test "invalid user not saved" do
    original_user_total = User.count
    u = User.new(name: "Don", email: "donald@example.com")
    u.save
    assert_equal (original_user_total), User.count
  end
=======
  def test_if_user_valid
    user = users(:marcus)

    assert_equal true, user.valid?

  end

  # test "the truth" do
  #   user = users(:daniel)
  #   puts User.first
  #   assert_equal true, user.valid?
  # end
>>>>>>> upstream/master

end
