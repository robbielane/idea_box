require 'test_helper'

class UserLoginFeatureTest < ActionDispatch::IntegrationTest
  test 'user can see login features as root' do
    visit '/'

    assert page.has_content?("Login")
  end

  test 'user clicking login redirects to idea index for user' do
    User.create(username: "Clarence",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal ideas_path, current_path
  end
end
