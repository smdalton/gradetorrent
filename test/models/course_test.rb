require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @org = organizations(:one)
    @teacher = users(:teacher)
    @student = users(:student)
    @admin = users(:admin)
    @course = courses(:one)
  end

  test 'course does not save unless organization present' do
    assert_not Course.new(name: 'Test Name').save
  end

  test 'Course returns correct teacher when model method called' do
    CourseUser.create!(course: @course, user: @teacher)
    assert @course.teacher == @teacher
  end

  test 'course not editable by student' do

  end

  test 'course editable by teacher' do

  end

end
