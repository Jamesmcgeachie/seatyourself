class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :restaurant, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :body
      t.string :title

      t.timestamps null: false
    end
  end
end
