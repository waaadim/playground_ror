class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :social_networks, :name
  end
end
