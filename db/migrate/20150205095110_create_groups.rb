class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :groups, :users
  end
end
