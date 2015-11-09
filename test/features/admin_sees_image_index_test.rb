require 'test_helper'

class AdminImageViewIndexTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees images index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_images_path
    assert page.has_content?("All Images")
  end

  test 'logged in default user does not see admin category index' do
    user = User.create(username: "Ross",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path
    refute page.has_content?("All Images")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
