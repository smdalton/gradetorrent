class CreateCoursesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :courses_users do |t|
      t.integer :course_id
      t.integer  :user_id
    end
  end
end
