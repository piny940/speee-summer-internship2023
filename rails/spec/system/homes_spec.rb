# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  prefecture_count = 3
  city_count = 4
  before do
    (0...prefecture_count).each do
      prefecture = create(:prefecture)
      (0...city_count).each do
        create(:city, prefecture_id: prefecture.id)
      end
    end
  end

  describe '/' do
    context '全ての都道府県の全ての市区町村が表示される' do
      it '都道府県の数が正しい' do
        visit root_path
        expect(all('.prefecture').count).to eq prefecture_count
      end

      it '都道府県の名前が正常に表示されている' do
        visit root_path
        expect(all('.prefecture h3.card-title')[0]).to have_content Prefecture.first.name
      end

      it '市区町村の数が正しい' do
        visit root_path
        within(all('.prefecture')[0]) do
          expect(all('.city').count).to eq city_count
        end
      end

      it '市区町村のリンクのラベルが正しい' do
        visit root_path
        within(all('.prefecture')[0]) do
          expect(all('.city a')[0]).to have_content Prefecture.first.cities.first.name
        end
      end
    end
  end
end
