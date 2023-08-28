# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  let(:branch) do
    branch = create(:branch)
    create(:sale_review, branch_id: branch.id)
    branch
  end

  describe '必須要素の確認' do
    context 'データが正しく加工されていることを確認' do
      it '平均評価が' do
        visit branch_path branch
        expect(find('.btn.text-center.w-auto.btn--link')).to have_content '査定依頼をする'
      end
    end
  end
end
