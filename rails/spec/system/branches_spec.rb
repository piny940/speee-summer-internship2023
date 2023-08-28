# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  let(:branch) do
    branch = create(:branch)
    create(:sale_review, branch_id: branch.id,
                         service_satisfaction: 4,
                         sale_price_satisfaction: 3,
                         speed_satisfaction: 2)
    create(:sale_review, branch_id: branch.id,
                         service_satisfaction: 4,
                         sale_price_satisfaction: 3,
                         speed_satisfaction: 2)
    create(:sale_review, branch_id: branch.id,
                         service_satisfaction: 3,
                         sale_price_satisfaction: 2,
                         speed_satisfaction: 1)
    create(:sale_review, branch_id: branch.id,
                         service_satisfaction: 3,
                         sale_price_satisfaction: 2,
                         speed_satisfaction: 1)
    branch
  end

  describe '平均値の計算' do
    context '全ての口コミの service_stisfaction を平均する' do
      it '(4 + 4 + 3 + 3) / 4.0 = 3.5' do
        visit branch_path branch
        expect(page).to have_content '平均評価★3.5'
      end
    end

    context '３種類の評価値について、全ての口コミの平均値を計算し、その値を計算する' do
      it '(3.5 + 2.5 + 1.5) / 3.0 = 2.5' do
        visit branch_path branch
        expect(find('.average-sale-score')).to have_content '2.5'
      end
    end
  end

  describe '必要な要素の表示' do
    context '企業名と店舗名が正しく取得されて表示されているか' do
      it '企業名 = ベテすま不動産１' do
        visit branch_path branch
        expect(page).to have_content branch.company.name
      end

      it '店舗名 = ベテすま店１' do
        visit branch_path branch
        expect(page).to have_content branch.name
      end
    end
  end
end
