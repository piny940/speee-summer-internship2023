# frozen_string_literal: true

class Assessment < ApplicationRecord
  belongs_to :assessment_user
  belongs_to :branch
  belongs_to :city

  with_options presence: true do
    validates :property_type
    validates :property_exclusive_area
    validates :property_land_area
    validates :property_building_area
    validates :property_building_area_unit
    validates :property_floor_area
    validates :property_room_plan
    validates :property_constructed_year
  end

  with_options numericality: true do
    validates :property_exclusive_area
    validates :property_land_area
    validates :property_building_area
    validates :property_floor_area
  end

  validates :property_type, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :property_building_area_unit,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :property_room_plan,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 13 }
  validates :property_constructed_year,
            numericality: { only_integer: true, greater_than_or_equal_to: 1925, less_than_or_equal_to: 2016 }
end
