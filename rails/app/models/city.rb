# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :branches, dependent: :destroy
  has_many :branch_city_assessables, dependent: :destroy
  has_many :assessor_branches, through: :branch_city_assessables, source: :branch
end
