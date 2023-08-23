require 'rails_helper'

RSpec.describe Branch, type: :model do
  fixtures :prefectures
  fixtures :cities
  fixtures :companies
  fixtures :branches
  fixtures :branch_city_assessables

  let(:branch) { branches(:one) }
  let(:city) { cities(:one) }

  describe '査定可能な都市をassessable_citiesで処理できる' do
    it('正常に取得できる') do
      expect(branch.assessable_cities.length).to eq 1
    end
  end
end
