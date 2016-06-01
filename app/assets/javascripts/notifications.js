$(document).ready(function(){
    if ($("#notify_div").length > 0){
        var type = $("#notify_div").data("type");
        var message = $("#notify_div").data("message");
        PNotify.prototype.options.styling = "fontawesome";
        console.log("Type: " + type + "\nMessage: " + message);
        new PNotify({
            title: 'Notification!',
            text: message,
            type: type
        });

    }
});