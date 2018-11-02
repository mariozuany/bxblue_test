class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :city
      t.string :country
      t.string :weather_condition
      t.float :temperature_celsius
      t.float :latitude
      t.float :longitude
      t.timestamp :post_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
