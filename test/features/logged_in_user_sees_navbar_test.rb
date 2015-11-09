require 'test_helper'

class UserNavBarTest < ActionDispatch::IntegrationTest

  def login_user
    User.create(username: "Clarence",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'user can see navbar links' do
    login_user

    within 'nav' do
      assert page.has_content?("Logout")
      assert page.has_content?("My Ideas")
    end
  end
end
