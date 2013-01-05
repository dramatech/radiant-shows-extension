function addSeatingType(form, model) {
  if (validSeatingTypeName()) {
    new Ajax.Updater(
      $('seating').down('tbody'),
      relative_url_root + '/admin/seating_types/',
      {
        asynchronous: true,
        evalScripts: true,
        insertion: 'bottom',
        onComplete: function(response){ seatingTypeAdded(form); },
        onLoading: function(request){ seatingTypeLoading(form); },
        parameters: Form.serialize(form)
      }
    );
  }
}
function removeSeatingType(button, model) {
  var row = $(button).up('tr');
  var name = row.down('label').innerHTML;
  if (confirm('Remove the "' + name + '" seating?')) {
    row.down('.delete_input').setValue(true);
    row.down('.seating_type_name').clear();
    row.hide();
  }
}
function seatingTypeAdded(element) {
  $(element).previous('.busy').hide();
  $(element).down('.button').enable();
  $(element).up('.popup').closePopup();
  var seatingType_index = $('seating_type_counter').value;
  $('seating_types_attributes_' + seatingType_index + '_capacity').focus();
  $('seating_type_counter').setValue(Number(seatingType_index).succ());
  $('new_seating_type').reset();
}
function seatingTypeLoading(element) {
  $(element).down('.button').disable();
  $(element).previous('.busy').appear();
}
function validSeatingTypeName() {
  var seatingTypeName = $('seating_type_name');
  var name = seatingTypeName.value.downcase();
  if (name.blank()) {
    alert('Seating type cannot be empty.');
    return false;
  }
  return true;
}
function findSeatingTypeByName(name) {
  return $('seating').select('input.seating_type_name').detect(function(input) { return input.value.downcase() == name; });
}
