class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.text :link
      t.references :social_network, index: true, foreign_key: true
      t.references :poster, index: true, foreign_key: true
      t.date :publish_date

      t.timestamps null: false
    end
  end
end
