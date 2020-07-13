$(document).ready(function() {
  $('.tbody').on('click', '.destroy', function() {
    let id = $(this).data('id')
    let childTr = $(this).closest('tr')
    $.ajax({
      url: '/admin/departments/' + id,
      type: 'delete',
      success: function(data){
        childTr.remove()
        $('#department-tbody tr').each(function(i, tr) {
          $('#department-tbody tr:nth-child(' + i + ')').find('.row-id').text(i);
        })
        var counter = $('#department-tbody tr').length;
        $('#department-tbody tr:nth-child(' + counter + ')').find('.row-id').text(counter);
        $('.notification').html('')
        $('.notification').append('<div class="alert alert-success">'+ I18n.t('admin.departments.destroy.success') +'</div>')
        alert(I18n.t('admin.departments.destroy.confirm'))
      }
    })
    return false;
  })
})
