class CreateSaleReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_reviews do |t|
      t.references :branch, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :gender, null: false
      t.integer :age, null: false
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.integer :property_type, null: false
      t.integer :previous_experience, null: false # 売却回数
      t.datetime :begin_consideration_period, null: false # 売却検討時期
      t.datetime :assessment_request_period, null: false # 査定依頼時期
      t.datetime :begin_sale_period, null: false # 売出時期
      t.datetime :sale_period, null: false # 売却時期
      t.datetime :transfer_period, null: false # 引渡時期
      t.integer :speed_satisfaction, null: false # 売却スピードの満足度
      t.integer :assessed_price, null: false # 査定価格
      t.integer :begin_sale_price, null: false # 販売価格
      t.boolean :discounted, null: false # 値下げしたかどうか
      t.integer :discounted_period_from_begin_sale, null: false, default: -1 # 売り出してから何ヶ月後に値下げしたか
      t.integer :discount_amount, null: false, default: 0 # 値下げ価格
      t.integer :final_sale_price, null: false # 成約価格
      t.integer :sale_price_satisfaction, null: false # 売却価格の満足度
      t.integer :agency_type, null: false # 媒介契約の形態
      t.string :title, null: false # 見出し
      t.integer :sale_reason, null: false # 売却理由
      t.integer :concerns, null: false # 売却時に不安だったこと
      t.integer :decision_factor, null: false # この会社に決めた理由
      t.integer :service_satisfaction, null: false # 不動産会社の対応満足度の理由
      t.string :service_satisfaction_reason, null: false # 不動産会社の対応満足度の理由
      t.string :advice_for_next, null: false # 今後売却する人へのアドバイス
      t.string :complaint, null: false, default: '' # 不動産会社に改善してほしい点



      t.timestamps
    end
  end
end
