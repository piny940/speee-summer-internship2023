# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  PREFECTURES_COUNT = 3
  CITIES_COUNT = 4
  before do
    (0...PREFECTURES_COUNT).each do
      prefecture = create(:prefecture)
      (0...CITIES_COUNT).each do
        create(:city, prefecture_id: prefecture.id)
      end
    end

  end

  describe '/' do
    it '全ての都道府県の全ての市区町村が表示される' do
      visit root_path
      expect(all('.prefecture').count).to eq Prefecture.count
      
      within('.prefecture') do
        expect(all('.city').count).to eq CITIES_COUNT
      end
    end
  end
end
