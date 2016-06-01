$('#tab1').on('click', function() {
    $('#name_list').text('User List');
    $('#info_list').text('(Select one to automatically fill adopter information)');
});

$('#tab2').on('click', function() {
    $('#name_list').text('Animal List');
    $('#info_list').text('(Select one to automatically fill animal information)');
});