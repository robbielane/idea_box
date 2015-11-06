require 'test_helper'

class AdminCategoryTest < ActionDispatch::IntegrationTest
  def create_admin
    @admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
  end

  test 'admin_can_create_category' do
    create_admin
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    visit admin_categories_path
    click_link 'Add Category'
    fill_in 'Name', with: 'NewCategory'
    click_button 'Create Category'

    assert_equal admin_categories_path, current_path
    assert page.has_content?('NewCategory')
  end

  test 'admin can view category index' do
    skip
  end

  test 'admin can get to show' do
    skip
  end

  test 'admin can edit category' do
    skip
  end

  test 'admin can delete category' do
    skip
  end
end
