class Admin::Prefectures::BulksController < Admin::Base
  def new; end

  def create
    file = params[:prefectures_csv]
    data = CSV.read(file.path)
    p data
  end
end
