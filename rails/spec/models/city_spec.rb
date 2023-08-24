# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  fixtures :prefectures
  fixtures :cities
  fixtures :companies
  fixtures :branches
  fixtures :branch_city_assessables

  let(:branch) { branches(:one) }
  let(:city) { cities(:one) }

  describe '自身を査定可能な店舗をassessor_branchesで処理できる' do
    it('正常に取得できる') do
      expect(city.assessor_branches.length).to eq 1
    end
  end
end
