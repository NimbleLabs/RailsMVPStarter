class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :description
      t.string :status
      t.string :stripe_id
      t.string :stripe_customer_id
      t.integer :created
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
