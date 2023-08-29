# frozen_string_literal: true

class HomesController < ApplicationController
  def show
    @prefectures = Prefecture.all.includes(:cities)
  end
end
