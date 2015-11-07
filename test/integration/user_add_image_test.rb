require 'test_helper'

class UserAddImageTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:'Robbie', password: 'password', role:0)

    visit login_path
    fill_in "Username", with: "Robbie"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'user can add images to idea' do
    idea = @user.ideas.create(title: "Idea", body:"the whole idea")
    image =  Image.create(name: "Funny Picture", link:"dkfjagh.com")

    visit idea_path(idea)

    click_link "Add Image"

    click_link "Funny Picture"

    assert page.has_content?("Funny Picture")
  end

  test 'user can add many images to idea' do
    idea = @user.ideas.create(title: "Idea", body:"the whole idea")
    image_one =  Image.create(name: "Funny Picture", link:"dkfjagh.com")
    image_two =  Image.create(name: "Funnier Picture", link:"dkfjagh.com")

    visit idea_path(idea)

    click_link "Add Image"

    click_link "Funny Picture"

    assert page.has_content?("Funny Picture")

    click_link "Add Image"

    click_link "Funnier Picture"
    assert page.has_content?("Funny Picture")
    assert page.has_content?("Funnier Picture")
  end

end
