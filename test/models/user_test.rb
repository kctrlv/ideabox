require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user can be created as admin" do
    user = User.create(username: "bob",
                       password: "yellow",
                       role: 1)

    assert_equal(user.role, "admin")
    assert(user.admin?)
  end

  test "user can be created as a default user" do
    user = User.create(username: "sam",
                       password: "pass")

    assert_equal(user.role, "default")
    assert(user.default?)
  end
end
