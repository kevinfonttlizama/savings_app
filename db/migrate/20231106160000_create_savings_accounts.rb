class CreateSavingsAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :savings_accounts do |t|
      t.string :name
      t.integer :balance

      t.timestamps
    end
  end
end
