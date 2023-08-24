# frozen_string_literal: true

class AssessmentsController < ApplicationController
  
  def new
    @assessment_user = AssessmentUser.new
    @assessment = Assessment.new
  end

  def create
    @assessment_user = AssessmentUser.new(assessment_user_params)
    @assessment = @assessment_user.assessments.new(assessment_params)
    
    if @assessment_user.valid? && @assessment.valid?
      ActiveRecord::Base.transaction do
        @assessment_user.save!
        @assessment.save!
      end
      redirect_to assessments_success_path
    else
      render 'new', status: :unprocessable_entity
    end

    # if @assessment_user.save
    #   @assessment = @assessment_user.assessments.new
    #   @assessment.assign_attributes(assessment_params)
    #   if @assessment.save
    #     # TODO: Sprint2の後続IssueにてAPIリクエストを行う
    #     redirecto_to assessments_success_path
    #   else
    #     render 'new', status: :unprocessable_entity
    #   end
    # else
    #   render 'new', status: :unprocessable_entity
    # end
  end

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

  def succsess
  end
end