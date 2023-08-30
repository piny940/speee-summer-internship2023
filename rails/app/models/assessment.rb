# frozen_string_literal: true

class Assessment < ApplicationRecord
  belongs_to :assessment_user
  belongs_to :branch
  belongs_to :city

  with_options presence: true do
    validates :property_type
    validates :property_room_plan
    validates :property_constructed_year
  end

  with_options numericality: true do
    validates :property_exclusive_area
    validates :property_land_area
    validates :property_building_area
  end

  validates :property_constructed_year,
            numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: 1925,
                            less_than_or_equal_to: 2016 }
  validate :validate_property_exclusive_area
  validate :validate_property_land_area
  validate :validate_property_building_area

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

  def validate_property_exclusive_area
    return unless property_type == 'apartment' && (property_exclusive_area.nil? || property_exclusive_area.zero?)

    errors.add(:property_exclusive_area, 'を指定してください')
  end

  def validate_property_land_area
    return unless %w[house land].include?(property_type) && (property_land_area.nil? || property_land_area.zero?)

    errors.add(:property_land_area, 'を指定してください')
  end

  def validate_property_building_area
    return unless property_type == 'house' && (property_building_area.nil? || property_building_area.zero?)

    errors.add(:property_building_area, 'を指定してください')
  end
end
