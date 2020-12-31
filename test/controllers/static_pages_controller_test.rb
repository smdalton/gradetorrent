require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test 'should get home' do
    get root_path
    puts response
    assert_response :success
  end

  # test "visiting the index" do
  #   visit posts_url
  #   assert_selector "h1", text: "Posts"
  # end

end
