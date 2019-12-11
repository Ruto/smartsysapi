class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :alias
      t.string :type
      t.string :ancestry
      t.string :category
      t.boolean :active, default: true
      t.integer :structure_id
      t.integer :user_id

      t.timestamps
    end
    add_index :structures, [:ancestry, :structure_id, :user_id]
  end
end
