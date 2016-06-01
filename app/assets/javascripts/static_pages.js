/**
 * Created by tita on 06-05-2016.
 */
$(document).ready(function() {
    $('#myCarousel').carousel();
});


$(".nav a").on("click", function(){
    $(".nav").find(".active").removeClass("active");
    $(this).parent().addClass("active");
});


$('#backToTop').click(function(){
    $('html,body').animate({scrollTop:0},'slow');return false;
});

window.setTimeout(function() {
    $(".alert").fadeOut("slow"); }, 2000);



