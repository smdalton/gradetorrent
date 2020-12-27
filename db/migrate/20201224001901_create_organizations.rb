class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :state
      t.timestamps
    end
  end
end
