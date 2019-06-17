class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :book_id
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
