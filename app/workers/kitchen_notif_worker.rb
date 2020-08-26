class KitchenNotifWorker
  include Sidekiq::Worker
  def perform user_id, food_name
    ActionCable.server.broadcast "kitchen_channel_#{user_id}", name: food_name
  end
end
