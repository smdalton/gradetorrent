require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @course = courses(:one)
    @org = organizations(:one)
    @teacher = users(:teacher)
    @student = users(:student)
    @admin = users(:admin)
  end


  test "should get correct index as student" do
    sign_in @student
    get courses_url
    assert_response :success
    # Check every course assosciated with the student and ensure it is present in the
    # page that is rendered to the current signed in student
    assert false
  end

  test "should not get new when signed in as student" do
    sign_in @student
    get new_course_url
    assert_response :redirect
  end

  test "should get new when signed in as teacher" do
    sign_in @teacher
    get new_course_url
    assert_response :success
  end


  test "should get new when signed in as administrator" do
    sign_in @admin
    get new_course_url
    assert_response :success
  end

  test 'should not create course when signed in as student' do
    sign_in @student
    assert_no_difference 'Course.count' do
      post courses_url, params: { course: { description: @course.description, end_date: @course.end_date,
                                            name: @course.name, organization_id: @course.organization_id,
                                            start_date: @course.start_date } }
    end

  end

  test 'should create course when signed in as teacher' do
    sign_in @teacher
    assert_difference('Course.count') do
      post courses_url, params: { course: { description: @course.description, end_date: @course.end_date,
                                            name: @course.name, organization_id: @course.organization_id,
                                            start_date: @course.start_date } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test 'should create course when signed in as administrator' do
    sign_in @admin
    assert_difference('Course.count') do
      post courses_url, params: { course: { description: @course.description, end_date: @course.end_date,
                                            name: @course.name, organization_id: @course.organization_id,
                                            start_date: @course.start_date } }
    end

    assert_redirected_to course_url(Course.last)
  end


  test 'Students should only see their own courses' do
    assert false
  end

  test 'Teachers should only see their own courses' do
    assert false
  end

  test 'should not get edit as student' do
    get edit_course_url(@course)
    assert_response :redirect
  end

  test 'should not update course as student' do
    patch course_url(@course), params: { course: { description: @course.description, end_date: @course.end_date,
                                                   name: @course.name, organization_id: @course.organization_id,
                                                   start_date: @course.start_date } }
    assert_redirected_to sign_in_path
  end

  test 'should destroy course if admin' do
    sign_in @admin
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end

  test 'should destroy course if teacher owns course' do
    sign_in @admin
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end
    assert_redirected_to courses_url
  end

  test 'should not destroy course if teacher does not own course' do
    assert_no_difference 'Course.count' do
      delete course_url(@course)
    end

  end


end
