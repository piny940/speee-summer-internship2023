# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Assessments' do
  subject { page }

  describe '必須要素の確認' do
    context '査定依頼ページを表示した場合' do
      let(:branch) { create(:branch) }

      before do
        visit new_branch_assessment_path(branch)
      end

      it { is_expected.to have_current_path(new_branch_assessment_path(branch)) }
      it { is_expected.to have_selector '.page_title', text: '査定依頼フォーム' }
      it { is_expected.to have_text 'お名前' }
      it { is_expected.to have_field 'assessment_user[last_name]' }
      it { is_expected.to have_field 'assessment_user[first_name]' }
      it { is_expected.to have_text 'フリガナ' }
      it { is_expected.to have_field 'assessment_user[last_name_kana]' }
      it { is_expected.to have_field 'assessment_user[first_name_kana]' }
      it { is_expected.to have_text 'メールアドレス' }
      it { is_expected.to have_field 'assessment_user[email]' }
      it { is_expected.to have_text '電話番号' }
      it { is_expected.to have_field 'assessment_user[tel]' }
      it { is_expected.to have_text '都道府県・市区町村' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][city_id]"]' }
      it { is_expected.to have_text '物件住所（市区町村以下）' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_address]"]' }
      it { is_expected.to have_text '物件種別' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][property_type]"]' }
      it { is_expected.to have_text '専有面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_exclusive_area]"]' }
      it { is_expected.to have_text '土地面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_land_area]"]' }
      it { is_expected.to have_text '建物面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_building_area]"]' }
      it { is_expected.to have_text '間取り' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][property_room_plan]"]' }
      it { is_expected.to have_text '竣工年' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_constructed_year]"]' }
      it { is_expected.to have_button '査定依頼する' }
    end
  end

  describe '査定依頼送信の確認' do
    let(:branch) { create(:branch) }
    let(:city) { create(:city) }
    let(:assessment) do
      branch.assessable_cities << city
      build(:valid_assessment, branch_id: branch.id, city_id: city.id)
    end

    it '正しい入力内容で査定依頼を行った場合' do # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
      visit new_branch_assessment_path(branch_id: assessment.branch.id)

      fill_in 'assessment_user[last_name]', with: assessment.assessment_user.last_name
      fill_in 'assessment_user[first_name]', with: assessment.assessment_user.first_name
      fill_in 'assessment_user[last_name_kana]', with: assessment.assessment_user.last_name_kana
      fill_in 'assessment_user[first_name_kana]', with: assessment.assessment_user.first_name_kana
      fill_in 'メールアドレス', with: assessment.assessment_user.email
      fill_in '電話番号', with: assessment.assessment_user.tel

      within '#assessment_user_assessment_city_id' do
        find("option[value=#{assessment.city.id}]").click
      end
      fill_in '物件住所（市区町村以下）', with: assessment.property_address
      within '#assessment_user_assessment_property_type' do
        find("option[value=#{assessment.property_type}]").click
      end
      fill_in '専有面積', with: assessment.property_exclusive_area
      fill_in '土地面積', with: assessment.property_land_area
      fill_in '建物面積', with: assessment.property_building_area
      within '#assessment_user_assessment_property_room_plan' do
        find("option[value=#{assessment.property_room_plan}]").click
      end
      fill_in '竣工年', with: assessment.property_constructed_year

      expect do
        click_on('査定依頼する')
      end.to change(AssessmentUser, :count).by(1).and change(Assessment, :count).by(1)

      expect(page).to have_current_path(success_branch_assessments_path(branch))
    end
  end
end
