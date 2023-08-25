class CreateAssessmentUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_users do |t|
      t.string :first_name, null: false, commnet: '名'
      t.string :last_name, null: false, commnet: '姓'
      t.string :first_name_kana, null: false, commnet: '名フリガナ'
      t.string :last_name_kana, null: false, commnet: '姓フリガナ'
      t.string :email, null: false, commnet: 'メールアドレス'
      t.string :tel, null: false, commnet: '電話番号'

      t.timestamps
    end
  end
end
