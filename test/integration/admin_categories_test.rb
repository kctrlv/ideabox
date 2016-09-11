require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test 'logged in admin can see categories' do
    admin = User.create(username: 'bob',
                        password: 'yellow',
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("Admin Categories")
  end

  test 'default user cannot see categories' do
    user = User.create(username: "steve",
                       password: "password",
                       role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path
    refute page.has_content?("Admin Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test 'logged in admin can make a new category' do
    admin = User.create(username: 'bob',
                        password: 'yellow',
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit new_admin_category_path
    assert page.has_content?("Create a New Category")


  end

end
