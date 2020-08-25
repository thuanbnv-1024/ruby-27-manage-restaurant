import consumer from './consumer'

consumer.subscriptions.create('KitchenChannel', {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    $("#notifications").html(data.name + I18n.t('order_item.ordered')).show().removeClass('d-none')
    setTimeout(function(){ $("#notifications").hide('slow') }, 2000);
  }
});
