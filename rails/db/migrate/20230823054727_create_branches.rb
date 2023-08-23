class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true
      t.string :logo_url, null: false
      t.string :post_number, null: false, default: ''
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.string :phone, null: false, default: ''
      t.string :fax_number, null: false, default: ''
      t.string :business_hours, null: false, default: ''
      t.string :regular_holiday, null: false, default: ''
      t.string :catchphrase, null: false
      t.string :introduction, null: false

      t.timestamps
    end
  end
end
