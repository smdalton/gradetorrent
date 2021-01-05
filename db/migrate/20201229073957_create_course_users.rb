class CreateCourseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :course_users do |t|
      t.integer :course_id
      t.integer  :user_id
    end
  end
end
