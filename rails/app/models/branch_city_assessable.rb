class BranchCityAssessable < ApplicationRecord
  belongs_to :city
  belongs_to :branch
end
