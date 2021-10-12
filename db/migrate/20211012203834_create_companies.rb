class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug, index: true, unique: true
      t.timestamps
    end
  end
end
