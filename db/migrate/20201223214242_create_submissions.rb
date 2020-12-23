class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.references :assignment,  null: false, foreign_key: true
      t.references :student,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
