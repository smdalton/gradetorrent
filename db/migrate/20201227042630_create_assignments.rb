class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.text :rubric
      t.date :assigned_on
      t.date :due_by
      t.date :eval_by
      t.integer :max_score
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
