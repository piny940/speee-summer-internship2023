# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    @assessment_user = AssessmentUser.new
    @assessment = Assessment.new
  end

  def create
    @assessment_user = AssessmentUser.new(assessment_user_params)
    @assessment = @assessment_user.assessments.new(assessment_params)

    save_assessment_user_and_assessment
  end

  def succsess; end

  private

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
                                                         :property_building_area_unit,
                                                         :property_floor_area,
                                                         :property_room_plan,
                                                         :property_constructed_year)
  end

  def save_assessment_user_and_assessment
    if @assessment_user.valid? && @assessment.valid?
      ActiveRecord::Base.transaction do
        @assessment_user.save!
        @assessment.save!
      end
      redirect_to assessments_success_path
    else
      render 'new', status: :bad_request
    end
  end
end
