class CreateBranchCityAssessables < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_city_assessables do |t|
      t.references :city, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
