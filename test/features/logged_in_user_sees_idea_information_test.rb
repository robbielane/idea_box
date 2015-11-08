require 'test_helper'

class IdeaShowTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  def create_user
    @user = User.create(username: "Clarence",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_idea
    @user.ideas.create(title: 'Some title', body: 'Some body')
    visit ideas_path
  end

  test 'user_can_see_title_and_body_on_show_page' do
    create_user
    create_idea

    click_link "Some title"

    assert page.has_content?("Some title")
    assert page.has_content?("Some body")
  end

end
