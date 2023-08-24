class Assessment < ApplicationRecord
  belongs_to :assessment_user
  belongs_to :branch
  belongs_to :city

  validates :branch_id, presence: true
  validates :city_id, presence: true
  validates :property_address, presence: true
  validates :property_type, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3}
  validates :property_exclusive_area, presence: true,
                                      numericality: true
  validates :property_land_area, presence: true,
                                 numericality: true
  validates :property_building_area, presence: true, 
                                     numericality: true
  validates :property_building_area_unit, presence: true, 
                                          numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2}
  validates :property_floor_area, presence: true,
                                  numericality: true,
                                  numericality: true
  validates :property_room_plan, presence: true,
                                 numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 13}
  validates :property_constructed_year, presence: true,
                                        numericality: { only_integer: true, greater_than_or_equal_to: 1925, less_than_or_equal_to: 2016}
end
