# frozen_string_literal: true

class CreateAssessmentUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_users do |t|
      t.string :first_name, null: false, comment: '名'
      t.string :last_name, null: false, comment: '姓'
      t.string :first_name_kana, null: false, comment: '名フリガナ'
      t.string :last_name_kana, null: false, comment: '姓フリガナ'
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :tel, null: false, comment: '電話番号'

      t.timestamps
    end
  end
end
