class CreateLanguagesTranslators < ActiveRecord::Migration
  def change
    create_table :languages_translators do |t|
      t.references :language, index: true, foreign_key: true
      t.references :translator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
