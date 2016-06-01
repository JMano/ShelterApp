$("#donation_type_select").on("change", function(){
    if ($("#donation_type_select").val() == 1) {
        document.getElementById("quantity_value").innerHTML = "€";
    }
        else if ($("#donation_type_select").val() == 2)
        {
            document.getElementById("quantity_value").innerHTML="Kg";
        }
    else{
        document.getElementById("quantity_value").innerHTML="";
    }

});



