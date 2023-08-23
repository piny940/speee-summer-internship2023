class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities, id: false, primary_key: 'id' do |t|
      t.integer :id, null: false
      t.string :name, null: false
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
