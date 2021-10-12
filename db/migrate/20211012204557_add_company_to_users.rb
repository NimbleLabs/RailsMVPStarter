class AddCompanyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_id, :integer
    add_column :users, :invitation_uuid, :string
  end
end
