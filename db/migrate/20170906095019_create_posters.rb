class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.integer :person_id
      t.integer :federal_legislator_id

      t.timestamps null: false
    end
    add_index :posters, :person_id
    add_index :posters, :federal_legislator_id
  end
end
