# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities' do
  subject { page }

  let(:city) do
    city = create(:city)
    (0..7).map do
      new_branch = create(:branch, city_id: city.id)
      create(:sale_review, branch_id: new_branch.id)
      city.assessor_branches << new_branch
    end
    city
  end

  describe 'エリアページのレスポンスコード確認' do
    before do
      get city_path id: city.id
    end

    it { expect(response).to have_http_status :ok }
  end

  describe 'エリアページの表示内容確認' do
    context '1ページ目を表示した場合' do
      before do
        visit city_path id: city.id
      end

      it { is_expected.to have_link href: root_path }
      it { is_expected.to have_selector 'h1', text: "#{city.prefecture.name} / #{city.name}の不動産会社" }
      it { is_expected.to have_selector '.card-body' }
      it { is_expected.to have_link href: city_path(id: city.id, page: 2) }

      it { is_expected.to have_text city.prefecture.name }
    end
  end
end
