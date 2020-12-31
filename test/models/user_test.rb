require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:shane)
    @organization = organizations(:one)
  end

  test 'true' do
    assert true
  end

  test 'user requires organization' do
    assert_no_difference 'User.count' do
      user2 = User.new(name: 'steve', organization: nil)
      user2.save
    end
  end

  test 'user saves correctly' do
    puts User.count
    assert_difference 'User.count' do
      user1 = User.new(email: 'Shane@dalton.com', name: 'Shane',
                       password: 'password',
                       encrypted_password: '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG',
                       organization: @organization)
      user1.save
    end
    puts User.count
  end


end
