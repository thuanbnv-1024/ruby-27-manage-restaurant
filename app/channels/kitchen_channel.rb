class KitchenChannel < ApplicationCable::Channel
  def subscribed
    stream_from "kitchen_channel_#{current_user.id}"
  end

  def unsubscribed; end
end
