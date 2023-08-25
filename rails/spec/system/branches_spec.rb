require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:branch) { 
    branch = FactoryBot.create(:branch)
    FactoryBot.create(:sale_review, branch_id: branch.id)
    branch
  }
  
  describe '必須要素の確認' do
    context 'データが正しく加工されていることを確認' do  
      it '平均評価が' do
        visit branch_path branch
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