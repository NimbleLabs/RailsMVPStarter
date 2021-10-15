class AddSubscriptionDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscription_id, :string, index: true
    add_column :users, :subscription_status, :string
  end
end
