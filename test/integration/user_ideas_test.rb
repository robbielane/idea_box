require 'test_helper'

class UserIdeasTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:'Robbie', password: 'password', role:0)

    visit login_path
    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_idea
    Category.create(name: 'Code')
    Idea.create(title: 'Some title', body: 'Some body', user_id: @user.id)
    visit ideas_path
  end

  test 'user_can_create_idea' do
    Category.create(name: 'Code')
    click_link 'Create Idea'
    fill_in "Title", with: "Project Idea"
    fill_in "Body", with: "Make an Idea Box"
    select 'Code', from: 'idea[category_id]'
    click_button "Submit"

    assert page.has_content?("Project Idea")
    assert page.has_content?("Make an Idea Box")
  end

  test 'user can edit idea' do
    create_idea
    click_link 'Some title'
    click_link 'Edit'
    fill_in 'Title', with: 'New Title'
    fill_in 'Body', with: 'New body'
    select 'Code', from: 'idea[category_id]'
    click_button 'Submit'

    assert page.has_content? 'New Title'
    assert page.has_content? 'New body'
  end

  test 'user can delete idea' do
    create_idea
    click_link 'Some title'
    click_link 'Delete'

    assert_equal ideas_path, current_path
    refute page.has_content? 'Some title'
    refute page.has_content? 'Some body'
  end
end
