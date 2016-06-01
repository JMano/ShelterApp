//Date_picker
    $(document).ready( function() {
        $('#date_picker').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_4",
            format: "YYYY-MM-DD"
        }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    $('#date_picker2').daterangepicker({
        singleDatePicker: true,
        calender_style: "picker_4",
        format: "YYYY-MM-DD"
    }, function(start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });
});


$(document).ready(function(){
    if ($('.slider').length > 0) {
        $('.slider').bxSlider({
            pagerCustom: '#bx-pager'
        });
    }
});


var options = {
    valueNames: [ 'name', 'contact', 'cc' ]
};

var userList = new List('users', options);

var options_animals = {
    valueNames: [ 'name', 'code' ]
};

var animal = new List('animals', options_animals);


