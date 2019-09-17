class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.string :name, null: false
      t.integer :number, null: false
      t.integer :messages_count, default: 0
      t.references :application, foreign_key: false
      t.timestamps
    end
    add_index :chats, [:application_id, :number], unique: true
  end
end
