require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  test "guest can create an account" do
    visit new_user_path
    fill_in 'Username', with: 'Robbie'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    assert page.has_content? 'Account Successfully Created'
  end

  test "guest must use unique username" do
    User.create(username: 'Robbie', password: 'password')
    visit new_user_path
    fill_in 'Username', with: 'Robbie'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    assert page.has_content? 'Username has already been taken'
  end
end
