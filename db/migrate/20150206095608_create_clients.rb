class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :fax
      t.string :job_position
      t.string :company
      t.belongs_to :subgroup, index: true, null: true
      t.belongs_to :group, index: true, null: true

      t.timestamps null: false
    end
  end
end
