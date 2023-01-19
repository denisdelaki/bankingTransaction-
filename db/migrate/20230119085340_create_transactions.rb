class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :from_account
      t.string :to_account
      t.decimal :amount
      t.datetime :timestamp

      t.timestamps
    end
  end
end
