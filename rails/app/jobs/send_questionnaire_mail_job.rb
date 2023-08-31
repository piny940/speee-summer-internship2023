# frozen_string_literal: true

class SendQuestionnaireMailJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.debug 'hoge'
  end
end
