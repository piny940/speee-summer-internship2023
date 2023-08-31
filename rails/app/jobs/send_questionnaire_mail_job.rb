class SendQuestionnaireMailJob < ApplicationJob
  queue_as :default

  def perform
    p 'hoge'
  end
end
