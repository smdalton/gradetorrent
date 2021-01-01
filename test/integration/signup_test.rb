require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @org = organizations(:one)
  end

  test 'invalid signup attempt' do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: {
          name: 'Test User', email: 'user@invalid',
          password: 'password', password_confirmation: 'password',
          organization_id: nil
      }}
    end
  end

  test 'valid signup attempt' do
    get new_user_registration_path
    assert_difference 'User.count' do
      post user_registration_path, params: { user: {
          name: 'Test User', email: 'user@invalid',
          password: 'password', password_confirmation: 'password',
          organization_id: @org.id
      }}
    end
  end

  test 'signup attempt is always a student' do
    get new_user_registration_path
    assert_no_difference 'Teacher.count + Administrator.count' do
      post user_registration_path, params: { user: {
          name: 'Test User', email: 'user@invalid',
          password: 'password', password_confirmation: 'password',
          organization_id: @org
      }}

    end
  end


end
