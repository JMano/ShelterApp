$(document).on "ready", ->
  if $("#animal_form").length > 0 && $("#animal_form").data('action') == 'edit'
    animal_type = $("#animal_form").data('animal-type')
    breed_id = $("#animal_form").data('breed-id')
    if animal_type == 1
      $('#select_dogs').show();
      $('#select_cats').hide();
      $("#select_dogs option[value='" + breed_id + "']").prop('selected', true)
    else
      $('#select_dogs').hide();
      $('#select_cats').show();
      $("#select_cats option[value='" + breed_id + "']").prop('selected', true)
