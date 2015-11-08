require 'test_helper'

class AdminNavBarTest < ActionDispatch::IntegrationTest

  def login_user
    User.create(username: "Clarence",
                       password: "password", role: 1)

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'admin can see admin navbar links' do
    login_user

    within 'nav' do
      assert page.has_content?("Logout")
      assert page.has_content?("My Ideas")
      assert page.has_content?("Add New Image")
      assert page.has_content?("Add New Category")
    end
  end

end
