require 'rails_helper'

RSpec.describe Assessment do

  describe 'モデル作成時のtest' do
    context '正しい情報で作成した場合' do
      it{ expect(FactoryBot.build(:valid_assessment)).to be_valid }
    end

    context '誤った情報で作成した場合' do
      it { expect(FactoryBot.build(:invalid_assessment)).not_to be_valid }
    end
  end

  describe 'モデル作成失敗時のバリデーション' do
    it 'モデル失敗作成時に正しいエラー文が出ているか' do
      invalid_assessment = FactoryBot.build(:invalid_assessment)
      invalid_assessment.valid?

      expect(invalid_assessment.errors[:property_address]).to include 'を入力してください'
      expect(invalid_assessment.errors[:property_type]).to include 'は3以下の値にしてください'
      expect(invalid_assessment.errors[:property_exclusive_area]).to include 'を入力してください'
      expect(invalid_assessment.errors[:property_building_area]).to include 'を入力してください'
      expect(invalid_assessment.errors[:property_building_area_unit]).to include 'は2以下の値にしてください'
      expect(invalid_assessment.errors[:property_floor_area]).to include 'を入力してください'
      expect(invalid_assessment.errors[:property_room_plan]).to include 'は13以下の値にしてください'
      expect(invalid_assessment.errors[:property_constructed_year]).to include 'は1925以上の値にしてください'
    end
  end
end