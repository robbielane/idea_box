require 'test_helper'

class AdminImageTest < ActionDispatch::IntegrationTest
  def create_admin
    @admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
  end

  test 'admin_can_create_image' do
    create_admin
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    visit admin_images_path
    click_link 'Add Image'
    fill_in 'Name', with: 'Newimage'
    click_button 'Create Image'

    assert_equal admin_images_path, current_path
    assert page.has_content?('Newimage')
  end

  test 'admin can view image index' do
    skip
  end

  test 'admin can get to show' do
    skip
  end

  test 'admin can edit image' do
    skip
  end

  test 'admin can delete image' do
    skip
  end
end
