class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|

      t.references    :organization, null: false, foreign_key: true
      t.references    :teacher, null: false, foreign_key: true
      t.timestamps
    end
  end
end
