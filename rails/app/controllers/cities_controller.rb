# frozen_string_literal: true

class CitiesController < ApplicationController

  def show
    @city = City.find_by(id: params[:id])
    @branches = @city.assessor_branches.page(params[:page])
  end
end