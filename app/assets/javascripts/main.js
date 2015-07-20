function setActive(controller){

    $("a").each( function(){
       $(this).removeClass("active");
    });

    $("a#"+controller).addClass("active");
}