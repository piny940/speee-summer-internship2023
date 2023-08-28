FactoryBot.define do
  factory :valid_assessment, class: Assessment do
    association :assessment_user, factory: :valid_assessment_user
    association :branch
    association :city

    property_address { '亀田中野町116-2' }
    property_type { '1' }
    property_exclusive_area { '3141.592' }
    property_land_area { '1122.33' }
    property_building_area { '116.77' }
    property_building_area_unit { '1' }
    property_floor_area { '555.2' }
    property_room_plan { '13' }
    property_constructed_year { '2000' }
  end

  factory :invalid_assessment, class: Assessment do
    association :assessment_user, factory: :invalid_assessment_user
    association :branch
    association :city

    # 文字列が空
    property_address { '' }
    # enum範囲外の数字
    property_type { '4' }
    # 入力が空
    property_exclusive_area { '' }
    property_land_area { '' }
    property_building_area { '' }
    # enum範囲外の数字
    property_building_area_unit { '5' }
    # 入力が空
    property_floor_area { '' }
    # enum範囲外の数字
    property_room_plan { '14' }
    # 仕様で決められた竣工年の範囲外
    property_constructed_year { '1924' }
  end
end