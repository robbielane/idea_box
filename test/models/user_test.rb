require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is valid' do
    user = User.new(username: 'Robbie', password: 'password')

    assert user.valid?
  end

  test 'username must be unique' do
    User.create(username: 'Robbie', password: 'password')
    user = User.new(username: 'Robbie', password: 'sdfgsdfadf')

    refute user.valid?
  end

  test 'user must have username' do
    user = User.new(password: 'password')

    refute user.valid?
  end

  test 'user must have password' do
    user = User.new(username: 'Robbie')

    refute user.valid?
  end
end
