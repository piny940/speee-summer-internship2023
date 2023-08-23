class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures, id: false, primary_key: 'id' do |t|
      t.integer :id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
