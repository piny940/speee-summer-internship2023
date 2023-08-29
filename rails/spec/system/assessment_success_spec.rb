# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AssessmentSuccess' do
  subject { page }

  describe '査定依頼成功ページのレスポンスコード確認' do
    before do
      get assessments_success_path
    end

    it { expect(response).to have_http_status 200 }
  end

  describe '査定依頼成功ページの表示内容確認' do
    before do
      visit assessments_success_path
    end

    it { should have_selector 'h1', text: 'お問い合わせありがとうございました' }
    it { should have_selector 'p', text: "査定依頼ありがとうございます。 不動産会社からのご連絡をお待ちください。" }
  end
end