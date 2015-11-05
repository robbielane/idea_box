require 'test_helper'

class UserIdeasTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:'Robbie', password: 'password', role:0)

    visit login_path
    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'user_can_create_idea' do
    click_link 'Create Idea'
    fill_in "Title", with: "Project Idea"
    fill_in "Body", with: "Make an Idea Box"
    click_button "Create Idea"

    assert page.has_content?("Project Idea")
    assert page.has_content?("Make an Idea Box")
  end

  test 'user can edit idea' do
    skip
    Idea.create(title: 'Some title', body: 'Some body', user_id: @user.id)
    click_link 'Some title'
    fill_in 'Title', with: 'New Title'
    fill_in 'Body', with: 'New body'
    click_button 'Update Idea'

    assert page.has_content? 'New Title'
    assert page.has_content? 'New body'
  end

  test 'user can delete idea' do
    skip
  end
end
