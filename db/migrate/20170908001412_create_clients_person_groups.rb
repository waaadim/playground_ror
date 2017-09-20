class CreateClientsPersonGroups < ActiveRecord::Migration
  def change
    create_table :clients_person_groups do |t|
      t.references :client, index: true, foreign_key: true
      t.references :person_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
