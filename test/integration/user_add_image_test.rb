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

    assert page.has_selector?("img[src$='#{image.link}']")
  end

  test 'user can add many images to idea' do
    idea = @user.ideas.create(title: "Idea", body:"the whole idea")
    image_one =  Image.create(name: "Funny Picture", link:"dkfjagh.com")
    image_two =  Image.create(name: "Funnier Picture", link:"dkfjasdfgh.com")

    visit idea_path(idea)
    save_and_open_page

    click_link "Add Image"
    click_link "Funny Picture"

    click_link "Add Image"
    click_link "Funnier Picture"
    
    assert page.has_selector?("img[src$='#{image_one.link}']")
    assert page.has_selector?("img[src$='#{image_two.link}']")
  end

end
