// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function () {
	$('a#flashend').click(function(e) {
		$('#flashblock').slideUp();
		e.preventDefault();
	});
// 	$("#search-jQuery").css({'display' : 'block'});
// 	$("#search_query").bind('keyup',function () {
// 		$.ajax({
// 			type: "POST",
// 			cache: true,
// 			url: baseURL + "/help_pages/auto_complete_for_search_query",
// 			data: $(this),
// 			success: function(msg) {
// 				$("#search_query_auto_complete").show();
// 				$("#search_query_auto_complete").html(msg);
// 			}
// 		});
// 	});
// 
// 	$('#searchbox'.parent).click(function() {
// 		$("#search_query_auto_complete").hide();
// 	});
// 	
// 	// Controls expanding/collapsing OL elements:
// //	$("#mc ol div").hide();
//   $("#mc ol a").click(function(){
//     $(this).parent().next("div").slideToggle("fast");
//   });

});




