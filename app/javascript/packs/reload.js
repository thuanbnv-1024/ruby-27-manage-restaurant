$(document).on("turbolinks:load", function() {
  $('#department-tbody tr').each(function(i, tr) {
    var a = i + 1
    $('#department-tbody tr:nth-child(' + a + ')').find('.row-id').text(a);
  })
})
