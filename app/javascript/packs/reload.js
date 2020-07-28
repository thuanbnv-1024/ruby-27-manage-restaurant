$(document).on("turbolinks:load", function() {
  $('#department-tbody tr').each(function(i, tr) {
    var sttTable = i + 1
    $('#department-tbody tr:nth-child(' + sttTable + ')').find('.row-id').text(sttTable);
  })
})
