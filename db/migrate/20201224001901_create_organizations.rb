class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :state
      t.timestamps
    end

    # enable a default organization to allow user registration
    # for unaffiliated users
    begin
      Organization.create! do |o|
        o.name = 'unaffiliated'
        o.state = 'unaffiliated'
      end
    rescue error => e
      # not implemented just here to set default org for user model
    end

  end
end
