class InforWorker
  include Sidekiq::Worker
  
  def perform hjson
    h = JSON.parse hjson
    SendInfomationMailer.restaurant_information(h["email"]).deliver_now
  end
end
