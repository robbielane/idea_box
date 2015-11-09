require 'test_helper'

class IdeasShowTest < ActionDispatch::IntegrationTest
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

  test 'user sees ideas listed on index' do
    create_user
    create_idea
    within '.card-title' do
      assert page.has_content?("Some title")
    end
  end

  test 'page links to new idea path' do
    create_user
    create_idea

    click_link "Create Idea"

    assert_equal new_idea_path, current_path
  end

end
