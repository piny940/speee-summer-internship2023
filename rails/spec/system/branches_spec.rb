<<<<<<< HEAD
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Branches' do
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

  describe '平均値の表示' do
    context '店舗に紐づく口コミの体験満足度' do
      it '表示される' do
        visit branch_path branch
        expect(page).to have_content '平均評価★3.5'
      end
    end

    context '店舗に紐づく口コミの売却に関する満足度' do
      it '表示される' do
        visit branch_path branch
        expect(find('.average-sale-score')).to have_content '2.5'
      end
    end
  end

  describe '必要な要素の表示' do
    context '企業名と店舗名が正しく取得されて表示される' do
      it '企業名が表示される' do
        visit branch_path branch
        expect(page).to have_content branch.company.name
      end

      it '店舗名が表示される' do
        visit branch_path branch
        expect(page).to have_content branch.name
      end
    end
  end
end
=======
require 'rails_helper'

RSpec.describe "Users", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  
  describe '必須要素の確認' do
    context 'データが正しく加工されていることを確認' do  
      it '平均評価が' do
        
      end
    end

    context '企業情報が正しく表示されていることを確認' do
    end
  end

  describe 'ページ遷移確認' do
    context '査定ページへ正しく遷移する場合' do
    end

    context '査定ページへ正しく遷移しない場合'
  end
end
>>>>>>> 27c9a4a ([add] （基盤）テストが動くことを確認)
