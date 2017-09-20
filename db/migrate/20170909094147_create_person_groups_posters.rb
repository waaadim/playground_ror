class CreatePersonGroupsPosters < ActiveRecord::Migration
  def change
    create_table :person_groups_posters do |t|
      t.references :poster, index: true, foreign_key: true
      t.references :person_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
