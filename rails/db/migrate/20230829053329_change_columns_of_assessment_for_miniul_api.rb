# frozen_string_literal: true

class ChangeColumnsOfAssessmentForMiniulApi < ActiveRecord::Migration[7.0]
  def up
    remove_column :assessments, :property_building_area_unit
    remove_column :assessments, :property_floor_area
    change_column :assessments, :property_exclusive_area, :float, null: false, default: 0, comment: '対象物件の専有面積'
    change_column :assessments, :property_land_area, :float, null: false, default: 0, comment: '対象物件の土地面積'
    change_column :assessments, :property_building_area, :float, null: false, default: 0, comment: '対象物件の建物面積'
  end

  def down
    add_column :assessments, :property_building_area_unit, :integer, null: false, default: 0, comment: '建物面積の単位'
    add_column :assessments, :property_floor_area, :float, null: false, default: 0, comment: '対象物件の延床面積'
  end
end
