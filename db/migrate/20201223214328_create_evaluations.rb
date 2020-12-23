class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.references :submission,   null: false, foreign_key: true
      t.references :student,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
