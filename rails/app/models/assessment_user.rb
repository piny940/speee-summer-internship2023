class AssessmentUser < ApplicationRecord
  has_many :assessments

    # メールアドレスをダウンケースにする
    before_save { email.downcase! }

    # 氏名フリガナに対してカタカナであるかどうかバリデーションをかける
    KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
    # 電話番号が0で始まるかどうかをチェックする正規表現
    TEL_REGEXP = /\A^0.*$\z/
    # メールアドレスの表現をチェックする正規表現
    EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # 氏名フリガナの存在とカタカナであるかどうかをチェック
    [:last_name_kana, :first_name_kana].each do |name_kana|
      validates name_kana, presence: true, format: { with: KATAKANA_REGEXP }
    end

    # 氏名の存在をチェック
    [:last_name, :last_name_kana].each do |name|
      validates name, presence: true
    end

    # 電話番号の存在と文字数、0で始まるかをチェック
    validates :tel, presence: true, length: { minimum: 10, maximum: 11 },
                    format: { with: TEL_REGEXP }

    # 氏名と氏名振り仮名がそれぞれ指定文字数を超えていないかチェック
    validate :validate_name_length
    validate :validate_name_kana_length

    # メールアドレスの存在と文字数、フォーマットをチェック
    validates :email, presence: true, length: { maximum: 100 },
                      format: { with: EMAIL_REGEXP }

    private
      # 氏名合計文字数制限(苗字文字数＋下の名前文字数 + 半角スペース<=32)
      def validate_name_length
        if last_name.length + first_name.length + 1 > 32
          errors.add(:last_name, ": 姓・名の合計文字数は31文字以下にしてください。")
        end
      end
      
      # 氏名フリガナ合計文字数制限(苗字文字数＋下の名前文字数 + 半角スペース<=64)
      def validate_name_kana_length
        if last_name_kana.length + first_name_kana.length + 1 > 64
          errors.add(:last_name_kana, ": 姓・名フリガナの合計文字数は63文字以下にしてください。")
        end
      end
end
