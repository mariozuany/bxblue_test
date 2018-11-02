class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_2
      t.string :alpha_3

      t.timestamps
    end
  end
end
