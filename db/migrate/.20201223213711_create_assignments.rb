class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references  :course, null: false, foreign_key: true
      t.references :teacher , null: false, foreign_key: true

      t.timestamps
    end
  end
end
