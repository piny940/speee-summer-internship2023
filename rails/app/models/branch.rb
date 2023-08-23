class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_cities, through: :branch_city_assessables, source: :city
end
