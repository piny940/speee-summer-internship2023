# frozen_string_literal: true

class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.references :assessment_user, null: false, foreign_key: true, comment: 'assessment_userのidへの外部キー'
      t.references :branch, null: false, foreign_key: true, comment: 'branchのidへの外部キー'
      t.references :city, null: false, foreign_key: true, comment: 'cityのidへの外部キー'
      t.string :property_address, null: false, comment: '対象物件の住所'
      t.integer :property_type, null: false, comment: '象物件の物件種別'
      t.float :property_exclusive_area, null: false, comment: '対象物件の専有面積'
      t.float :property_land_area, null: false, comment: '対象物件の土地面積'
      t.float :property_building_area, null: false, comment: '対象物件の建物面積'
      t.integer :property_building_area_unit, null: false, comment: '建物面積の単位'
      t.float :property_floor_area, null: false, comment: '対象物件の延床面積'
      t.integer :property_room_plan, null: false, comment: '対象物件の間取り'
      t.integer :property_constructed_year, null: false, comment: '対象物件の築年数(竣工年)'

      t.timestamps
    end
  end
end
