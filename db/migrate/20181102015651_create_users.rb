class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :fullname
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
