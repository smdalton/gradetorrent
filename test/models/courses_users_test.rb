require 'test_helper'

class CoursesUsersTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @org = organizations(:one)
    @teacher = users(:teacher)
    @student = users(:student)
    @admin = users(:admin)
    @course = courses(:one)
  end

  test 'course saves when user and course is present' do
    assert_difference 'CourseUser.count' do
      CourseUser.create(course: @course, user: @teacher)

    end
  end

  test 'course does not save when user is absent and course is present' do
    assert_no_difference 'CourseUser.count' do
      CourseUser.create(course: @course)
    end
  end

  test 'course does not save when user is present and course is absent' do
    assert_no_difference 'CourseUser.count' do
      CourseUser.create(user: @teacher)
    end
  end

  test 'courses_users returns correct teacher when model method called' do

  end



end
