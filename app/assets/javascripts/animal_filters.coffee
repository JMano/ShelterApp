clean_animals = (callback) ->
  $('#animals_list').empty()
  callback()
  return

append_animal = (id, name, has_image, img_url, age, gender, danger) ->
  endangered = ''
  if danger
    endangered = "<span class=\"fa fa-exclamation-circle text-danger\" aria-hidden=\"true\" title=\"This animal is in DANGER!\"></span>"
  img = ''
  place = "animal_placeholder.png"
  if has_image
    img = img_url
  else
    img = '/assets/images/animal_placeholder.png'
  $('#animals_list').append '<div class="col-md-3 portfolio-item"><div class="panel panel-default my_panel"><div class="panel-body"><a href="animals/' + id + '"><img src="' + img + '" class="img-responsive"></a></div><div class="panel-footer without-padding"><h4 class="without-margin">' + name + '&nbsp&nbsp' + endangered + '</h4><p class="without-margin"><small>Age: ' + age + '</small></p><p class="without-margin"><small>Gender: <span class="' + gender + '" aria-hidden="true"></span></small></p></div></div></div>'
  return

append_no_results = ->
  $('#animals_list').append '<div class="jumbotron"><h1 class="text-center">NO RESULTS</h1></div>'
  return

set_filtered_animals = ->
  breed_filter = $('#breed_filters').val();
  size_filter = $('#size_filters').val();
  age_filter = $('#age_filters').val();
  animal_type_filter = $('#animal_type_filters').val();
  $.ajax
    type: 'GET'
    url: '/animals/filters'
    dataType: 'json'
    data:
      breed_filter: breed_filter
      size_filter: size_filter
      age_filter: age_filter
      animal_type_filter: animal_type_filter
    success: (response) ->
      clean_animals ->
        i = 0
        if response.length > 0
          while i < response.length
            append_animal response[i].id, response[i].name, response[i].has_image, response[i].img_url,  response[i].age, response[i].gender, response[i].danger
            i++
          return
        else
          append_no_results()
        return
      return
  return

$(document).on 'change', '#animal_filters', ->
  set_filtered_animals()
  return

$('#the_cleaner').on 'click', ->
  $('#breed_filters').val(-1);
  $('#size_filters').val(-1);
  $('#age_filters').val(-1);
  set_filtered_animals()
  return
