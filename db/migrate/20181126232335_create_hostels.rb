class CreateHostels < ActiveRecord::Migration[5.2]
  def change
    create_table :hostels do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
