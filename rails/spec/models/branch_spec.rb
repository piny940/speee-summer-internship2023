# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Branch do
  fixtures :prefectures
  fixtures :cities
  fixtures :companies
  fixtures :branches
  fixtures :branch_city_assessables

  let(:branch) { branches(:one) }
  let(:one_city) { cities(:one) }
  let(:two_city) { cities(:two) }

  describe '査定可能な都市をassessable_citiesで処理できる' do
    it('正常に取得できる') do
      expect(branch.assessable_cities.length).to eq 1
    end

    it('正常に追加できる') do
      branch.assessable_cities.push(two_city)
      expect(branch.assessable_cities.length).to eq 2
    end
  end
end
