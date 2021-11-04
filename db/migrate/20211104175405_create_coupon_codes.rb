class CreateCouponCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :coupon_codes do |t|
      t.string :code
      t.string :offer
      t.references :user, index: true, null: true

      t.timestamps
    end

    add_column :users, :coupon_code, :string
  end
end
