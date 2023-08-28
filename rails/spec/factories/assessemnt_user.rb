FactoryBot.define do

  factory :valid_assessment_user, class: AssessmentUser do

    first_name { '太郎' }
    last_name { '田中' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'タナカ' }
    email { 'tarotanaka@example.com' }
    tel { '09023235656' }
  end

  factory :invalid_assessment_user, class: AssessmentUser do
    
    # 名前の文字数が多すぎる(31文字超)
    first_name { "太郎#{'a'*20}" }
    last_name { "田中#{'a'*8}" }
    # カタカナ以外の文字を含む，文字数が多すぎる(63文字超)
    first_name_kana { "タロウ#{'b'*30}" }
    last_name_kana { "タナカ#{'b'*28}" }
    # 文字数が多すぎる(100文字超)，ドメインに必要なドットがない
    email { "#{'t'*80}tarotanaka@examplecom" }
    # 文字数が多すぎる(10,11文字以外)，0から始まっていない
    tel { '123456789012' }
  end
end