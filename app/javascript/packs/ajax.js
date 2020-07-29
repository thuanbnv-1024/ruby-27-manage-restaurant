$(document).on("turbolinks:load", function() {
  $('.tbody').on('click', '.destroy', function() {
    let id = $(this).data('id')
    let childTr = $(this).closest('tr')
    $.ajax({
      url: '/admin/departments/' + id,
      type: 'delete',
      success: function(data){
        childTr.remove()
        $('#department-tbody tr').each(function(i, tr) {
          var sttTable = i + 1
          $('#department-tbody tr:nth-child(' + sttTable + ')').find('.row-id').text(sttTable);
        })
        $('.notification').html('')
        $('.notification').append('<div class="alert alert-success">' + I18n.t('admin.departments.destroy.success') + '</div>')
        alert(I18n.t('admin.departments.destroy.confirm'))
      }
    })
    return false;
  })
  $('.tbody-user').on('click', '.destroy-user', function() {
    let id = $(this).data('id')
    let childTr = $(this).closest('tr')
    $.ajax({
      url: '/admin/users/' + id,
      type: 'delete',
      success: function(data){
        childTr.remove()
        $('.tbody-user tr').each(function(i, tr) {
          var sttTable = i + 1
          $('.tbody-user tr:nth-child(' + sttTable + ')').find('.row-id').text(sttTable);
        })
        $('.notification').html('')
        $('.notification').append('<div class="alert alert-success">' + I18n.t('admin.departments.destroy.success') + '</div>')
        alert(I18n.t('admin.departments.destroy.confirm'))
      }
    })
    return false;
  })
})
