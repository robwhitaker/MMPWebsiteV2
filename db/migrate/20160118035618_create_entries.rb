class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :level
      t.integer :order
      t.string :title
      t.text :content
      t.datetime :release_date
      t.text :authors_note

      t.timestamps null: false
    end
  end
end
