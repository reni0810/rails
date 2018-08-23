$('document').ready(function(){
	$('#add_mail').click(function () {
  	var email;
  	email= '<form method="get" class ="form-inline" action="/restaurant_details/:restaurant_id/sendmail"><input type="text" name="send_mail" id="send_mail" class="form-control"> <input type="submit" class="btn-primary">';
  	$("p#email").append(email);
	});
});

document.addEventListener("turbolinks:load", function() {
  $("#datepicker").datepicker({
  	format: 'yyyy-mm-dd'
  });
})

document.addEventListener("turbolinks:load", function() {
  function dependent_load() {
  	$('.dependent-load').change(function(){
  		var element_id = $(this).data("target");
  		console.log(element_id);
      if ($("#" + element_id)){
  	    $("#" + element_id).empty();
  	  }
      if($(this).val() != ""){
        var url = $(this).data("url") + $(this).val();
        $.get(url, function(datas){
          if(datas){
            $.each(datas, function(index, value){
              $("#" + element_id).append(
                "<option value =‘" + value['id'] + "’>" +
                  value['name'] +
                "</option>"
              );
            }); 
          }
        }); 
      }
    });
    $('.dependent-load').removeClass('dependent-load');
  }
  dependent_load();

  $('#cuisines').on('cocoon:after-insert',function(){
    console.log("here");
    dependent_load();
  });

  $(".autocomplete").each(function() {
    $(".autocomplete").autocomplete({
      minLength: 1,
      source: $(this).data('url')
    });
  });
});


// function select_recipe(){
//   console.log($("#cuisine_id").val());
//    var url;
//    if($("#cuisine_id").val() != ""){
//      url = "/select_recipe?cuisine_id=" + $("#cuisine_id").val();
//      $("#recipe_id").empty()
//      $.get(url, function(datas){
//        if(datas){
//          $.each(datas,function(index, value){
//            $("#recipe_id").append("<option value ='" + value['id'] +"'>"+ value['name']+ "</option>");
//          })
//        }
//      });
//    }
// }