# frozen_string_literal: true

class AssessmentsController < ApplicationController
  before_action :require_branch

  def new
    @assessment_user = AssessmentUser.new
    @assessment = Assessment.new
    @prefecture = Prefecture.new
  end

  def create
    @assessment_user = AssessmentUser.find_or_initialize_by(assessment_user_params)
    @assessment = @assessment_user.assessments.new(assessment_params)
    @assessment.branch_id = @branch.id

    return render 'new', status: :bad_request \
      unless save_assessment_user_and_assessment(@assessment_user, @assessment)

    response = create_miniul_assessment(@assessment_user, @assessment)

    if response.code == '200'
      redirect_to success_branch_assessments_path(@branch)
    else
      redirect_to new_branch_assessment_path(@branch), alert: I18n.t('messages.assessment.miniul_api_fail')
    end
  end

  def succsess; end

  private

  def require_branch
    @branch = Branch.find(params[:branch_id])
  end

  def assessment_user_params
    params.require(:assessment_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                            :email, :tel)
  end

  def assessment_params
    params[:assessment_user].require(:assessment).permit(:branch_id,
                                                         :city_id,
                                                         :property_address,
                                                         :property_type,
                                                         :property_exclusive_area,
                                                         :property_land_area,
                                                         :property_building_area,
                                                         :property_room_plan,
                                                         :property_constructed_year)
  end

  def save_assessment_user_and_assessment(user, assessment)
    return false unless user.valid? && assessment.valid?

    ActiveRecord::Base.transaction do
      @assessment_user.save!
      @assessment.save!
    end
  end

  def create_miniul_assessment(assessment_user, assessment)
    Miniul.create_assessment({
                               branch_id: assessment.branch.id,
                               property_city: assessment.city.id,
                               property_address: assessment.property_address,
                               property_type: Assessment.property_types[assessment.property_type],
                               property_exclusive_area: assessment.property_exclusive_area,
                               property_land_area: assessment.property_land_area,
                               property_building_area: assessment.property_building_area,
                               property_room_plan: Assessment.property_room_plans[assessment.property_room_plan],
                               property_constructed_year: assessment.property_constructed_year,
                               user_email: assessment_user.email,
                               user_name: "#{assessment_user.last_name} #{assessment_user.first_name}",
                               user_name_kana: "#{assessment_user.last_name_kana} #{assessment_user.first_name_kana}",
                               user_tel: assessment_user.tel
                             })
  end
end
