// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
setModalParameter = function(id) {
    $("#buttonConfirmImageDelete").click(function() {
        $.ajax({
            url: '/animal_images/' + id,
            type: 'DELETE',
            dataType: "json",
            success: function(result) {
                if (result.ok == true) {
                    PNotify.prototype.options.styling = "fontawesome";
                    $("#image" + id).remove();
                    new PNotify({
                        title: 'Image deleted',
                        text: 'The image you selected was successfully deleted',
                        type: 'success'
                    });
                }
            },
            error: function(result) {
                alert("ERROR: " + result)
            }
        });
    });
}

$(document).ready(function(){
    if($('.slider').length>0) {
        $('.slider').bxSlider({
            pagerCustom: '#bx-pager'
        });
    }
});

$("#animal_type").on("change", function(){
    if($('#select_dogs').is(":visible")) {
        $('#select_dogs').hide();
        $('#select_cats').show();
    }
    else{
        $('#select_cats').hide();
        $('#select_dogs').show();
    }
});
