class CreatePersonGroups < ActiveRecord::Migration
  def change
    create_table :person_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
