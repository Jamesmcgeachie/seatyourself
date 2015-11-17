class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :restaurant, index: true, foreign_key: true
      t.integer :party_size
      t.datetime :seating_time

      t.timestamps null: false
    end
  end
end
