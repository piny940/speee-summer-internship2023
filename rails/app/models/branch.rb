# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :branch_city_assessables, dependent: :destroy
  has_many :assessable_cities, through: :branch_city_assessables, source: :city
end
