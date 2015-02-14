class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :string
      t.string :password_digest
      t.string :username
      t.string :name
      t.string :surname
      t.string :company

      t.timestamps null: false
    end
  end
end
