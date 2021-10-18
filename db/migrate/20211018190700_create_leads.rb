class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :email
      t.references :user, null: true, foreign_key: true
      t.string :slug, index: true, unique: true

      t.timestamps
    end
  end
end
