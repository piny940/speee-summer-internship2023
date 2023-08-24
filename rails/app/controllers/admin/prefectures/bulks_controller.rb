# frozen_string_literal: true

module Admin
  module Prefectures
    class BulksController < Admin::Base
      def new; end

      def create
        # file = params[:prefectures_csv]
        # data = CSV.read(file.path)
      end
    end
  end
end
