class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :name
       t.belongs_to :group, index: true
      t.timestamps null: false
    end
  end
end
