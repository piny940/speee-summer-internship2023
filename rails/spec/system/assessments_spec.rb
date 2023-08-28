require 'rails_helper'

RSpec.describe "Assessments", type: :system do
  subject { page }

  describe '必須要素の確認' do
    context '査定依頼ページを表示した場合' do
      before do
        visit new_branch_assessments_path(branch_id: 1)
      end

      it { is_expected.to have_current_path('/branches/1/assessments/new') }
      it { is_expected.to have_selector '.page_title', text: '査定依頼フォーム' }
      it { is_expected.to have_text 'お名前' }
      it { is_expected.to have_selector 'input[name="assessment_user[last_name]"]'}
      it { is_expected.to have_selector 'input[name="assessment_user[first_name]"]'}
      it { is_expected.to have_text 'フリガナ' }
      it { is_expected.to have_selector 'input[name="assessment_user[last_name_kana]"]'}
      it { is_expected.to have_selector 'input[name="assessment_user[first_name_kana]"]'}
      it { is_expected.to have_text 'メールアドレス' }
      it { is_expected.to have_selector 'input[name="assessment_user[email]"]'}
      it { is_expected.to have_text '電話番号' }
      it { is_expected.to have_selector 'input[name="assessment_user[tel]"]'}
      it { is_expected.to have_text '都道府県' }
      it { is_expected.to have_selector 'select[name="prefecture[id]"]'}
      it { is_expected.to have_selector 'input[name="query_prefecture"]' }
      it { is_expected.to have_text '市区町村' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][city_id]"]'}
      it { is_expected.to have_text '物件住所（市区町村以下）' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_address]"]'}
      it { is_expected.to have_text '物件種別' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][property_type]"]'}
      it { is_expected.to have_text '専有面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_exclusive_area]"]'}
      it { is_expected.to have_text '土地面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_land_area]"]'}
      it { is_expected.to have_text '建物面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_building_area]"]'}
      it { is_expected.to have_text '建物面積単位' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][property_building_area_unit]"]'}
      it { is_expected.to have_text '延床面積' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_floor_area]"]'}
      it { is_expected.to have_text '間取り' }
      it { is_expected.to have_selector 'select[name="assessment_user[assessment][property_room_plan]"]'}
      it { is_expected.to have_text '竣工年' }
      it { is_expected.to have_selector 'input[name="assessment_user[assessment][property_constructed_year]"]'}
      it { is_expected.to have_selector 'input[name="request_assessment"]' }
    end
  end
  
  describe '査定依頼送信の確認' do
    let!(:assessment) { FactoryBot.create(:valid_assessment) }

    it '正しい入力内容で査定依頼を行った場合' do  
      visit new_branch_assessments_path(branch_id: assessment.branch.id)
      fill_in 'assessment_user[last_name]', with: assessment.assessment_user.last_name
      fill_in 'assessment_user[first_name]', with: assessment.assessment_user.first_name
      fill_in 'assessment_user[last_name_kana]', with: assessment.assessment_user.last_name_kana
      fill_in 'assessment_user[first_name_kana]', with: assessment.assessment_user.first_name_kana
      puts find('#prefecture_id')['innerHTML']
      fill_in 'メールアドレス', with: assessment.assessment_user.email
      fill_in '電話番号', with: assessment.assessment_user.tel
      select '北海道', from: 'prefecture_id'
      find('input[name="query_prefecture"]').click
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
      within '#assessment_user_assessment_property_building_area_unit' do
        find("option[value=#{assessment.property_building_area_unit}]").click
      end
      fill_in '延床面積', with: assessment.property_floor_area
      within '#assessment_user_assessment_property_room_plan' do
        find("option[value=#{assessment.property_room_plan}]").click
      end
      fill_in '竣工年', with: assessment.property_constructed_year

      expect {
        find('input[name="request_assessment"]').click
      }.to change{ AssessmentUser.count }.by(1).and change{ Assessment.count }.by(1)
      
      expect(page).to have_current_path(assessments_success_path)
    end
  end
end