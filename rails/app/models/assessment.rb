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

  validates :property_constructed_year,
            numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: 1925, less_than_or_equal_to: 2016 }

  enum property_type: {
    apartment: 1,
    house: 2,
    land: 3
  }, _prefix: true

  enum property_building_area_unit: {
    square_meter: 1,
    tsubo: 2
  }, _prefix: true

  enum property_room_plan: {
    one_room: 1,
    one_k_dk: 2,
    one_lk_ldk: 3,
    two_k_dk: 4,
    two_lk_ldk: 5,
    three_k_dk: 6,
    three_lk_ldk: 7,
    four_k_dk: 8,
    foour_lk_ldk: 9,
    five_k_dk: 10,
    five_lk_ldk: 11,
    six_k_dk: 12,
    six_lk_ldk_or_more: 13
  }, _prefix: true
end
