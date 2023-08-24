class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.references :assessment_user, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :property_address, null: false
      t.integer :property_type, null: false
      t.float :property_exclusive_area, null: false
      t.float :property_land_area, null: false
      t.float :property_building_area, null: false
      t.integer :property_building_area_unit, null: false
      t.float :property_floor_area, null: false
      t.integer :property_room_plan, null: false
      t.integer :property_constructed_year, null: false

      t.timestamps
    end
  end
end
