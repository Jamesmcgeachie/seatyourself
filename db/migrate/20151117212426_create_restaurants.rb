class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.text :summary
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :website_url

      t.timestamps null: false
    end
  end
end
