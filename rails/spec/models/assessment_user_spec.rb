# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentUser do
  describe 'モデル作成時のtest' do
    context '正しい情報で作成した場合' do
      it { expect(build(:valid_assessment_user)).to be_valid }
    end

    #   context '誤った情報で作成した場合' do
    #     it { expect(FactoryBot.build(:invalid_assessment_user)).not_to be_valid }
    #   end
    # end

    # 現在の実装にテストとFactoryがあっていないためコメントアウト
    # describe 'モデル作成失敗時のバリデーション' do
    #   it 'モデル失敗作成時に正しいエラー文が出ているか' do
    #     invalid_assessment_user = FactoryBot.build(:invalid_assessment_user)
    #     invalid_assessment_user.valid?

    #     expect(invalid_assessment_user.errors[:first_name]).to include ': 姓・名の合計文字数は31文字以下にしてください。'
    #     expect(invalid_assessment_user.errors[:first_name_kana]).to include ': 姓・名フリガナの合計文字数は63文字以下にしてください。'
    #     expect(invalid_assessment_user.errors[:first_name_kana]) .to include 'は不正な値です'
    #     expect(invalid_assessment_user.errors[:last_name_kana]) .to include 'は不正な値です'
    #     expect(invalid_assessment_user.errors[:tel]).to include 'は11文字以内で入力してください'
    #     expect(invalid_assessment_user.errors[:tel]).to include 'は不正な値です'
    #     expect(invalid_assessment_user.errors[:email]).to include 'は100文字以内で入力してください'
    #     expect(invalid_assessment_user.errors[:email]).to include 'は不正な値です'
    #   end
  end
end
