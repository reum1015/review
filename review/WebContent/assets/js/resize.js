	
	function varHeight() {
			var wheight = document.getElementById("content_height").offsetHeight;
			$("#slider_main").css({'height':wheight +'px'});
	}
	
	window.onresize = varHeight;