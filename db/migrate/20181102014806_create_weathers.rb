class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :condition

      t.timestamps
    end
  end
end
