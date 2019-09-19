class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :body, null: false
      t.references :chat, foreign_key: true
      t.timestamps
    end
    add_index :messages, [:chat_id, :number], unique: true
  end
end
