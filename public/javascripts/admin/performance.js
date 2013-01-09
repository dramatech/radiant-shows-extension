function addPerformance(form) {
  if (validPerformanceDate()) {
    new Ajax.Updater(
      $('performances').down('tbody'),
      relative_url_root + '/admin/performances/',
      {
        asynchronous: true,
        evalScripts: true,
        insertion: 'bottom',
        onComplete: function(response){ performanceAdded(form); },
        onLoading: function(request){ performanceLoading(form); },
        parameters: Form.serialize(form)
      }
    );
  }
}
function removePerformance(button) {
  var row = $(button).up('tr');
  if (confirm('Remove the performance?')) {
    row.down('.delete_input').setValue(true);
    row.hide();
    row.next().hide();
  }
}
function performanceAdded(element) {
  $(element).previous('.busy').hide();
  $(element).down('.button').enable();
  $(element).up('.popup').closePopup();
  var performance_index = $('performance_counter').value;
  $('performances_attributes_' + performance_index + '_notes').focus();
  $('performance_counter').setValue(Number(performance_index).succ());
  $('new_performance').reset();
}
function performanceLoading(element) {
  $(element).down('.button').disable();
  $(element).previous('.busy').appear();
}
// TODO: Verify dates client side.
function validPerformanceDate() {
  var performanceDate = $('performance_start_datetime');
  var date = performanceDate.value.downcase();
  if (date.blank()) {
    alert('Date cannot be blank.');
    return false;
  }
  return true;
}
