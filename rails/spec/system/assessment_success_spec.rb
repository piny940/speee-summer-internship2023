# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AssessmentSuccess' do
  subject { page }

  let(:branch) { create(:branch) }

  describe '査定依頼成功ページのレスポンスコード確認' do
    before do
      get success_branch_assessments_path branch_id: branch.id
    end

    it { expect(response).to have_http_status :ok }
  end

  describe '査定依頼成功ページの表示内容確認' do
    before do
      visit success_branch_assessments_path branch_id: branch.id
    end

    it { is_expected.to have_selector 'h1', text: 'お問い合わせありがとうございました' }
    it { is_expected.to have_selector 'p', text: '査定依頼ありがとうございます。 不動産会社からのご連絡をお待ちください。' }
  end
end
