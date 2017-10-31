class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :first_name
      t.string :last_name
      t.string :source
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
