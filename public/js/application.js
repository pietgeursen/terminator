$(document).ready(function() {

	var coloursArray = [];

	$.getJSON("/colours", function(data){
		coloursArray = data.tags;
		
		appendColouredDivs(coloursArray);
	})

	function appendColouredDivs(colours){
		for(var i = 0; i < colours.length; i++){
			colour = colours[i].color;

			var $newDiv = $("<div class='colour_box'></div>")
			$newDiv.css('background-color', colour);
			$newDiv.css('width', 100/colours.length +"%")
			$('#terminator').append($newDiv);
		}

	}

	
	

});
