var homeManager = (function() {
	var truckList="";
	function list(page, callback) {
		if(page==null){
			page = 0;
		}		
		$.getJSON('http://localhost/home/list/'+page, function (data){
			console.log(data);
			for(var i=0; i<data.distance.length; i++){
				var distance= data.distance[i].distance*10000;
				distance = distance.toFixed(1);
				truckList += "<li class='restaurant-item'><div class='popular_restaurant_inner_wrap'><figure class='restaurant-item'><div class='thumb' style='background-image: url(img/1.jpg)'></div>" +
						"<div class='info'><span class='title'>"+data.distance[i].co_name+
						"</span> <strong class='point search_point'>"+data.distance[i].grade+
						"</strong><p class='etc'>"+data.distance[i].location+
						"</p><p class='etc'>"+distance+"m</p></div></figure></div></li>"					
			}
			$("#list").html(truckList);
		});
	}	
	function moreList(page, callback){		
		$.getJSON('http://localhost/home/list/'+page, function (data){
			for(var i=0; i<data.distance.length; i++){
				var distance= data.distance[i].distance*10000;
				distance = distance.toFixed(1);
				truckList += "<li class='restaurant-item'><div class='popular_restaurant_inner_wrap'><figure class='restaurant-item'><div class='thumb' style='background-image: url(img/1.jpg)'></div>" +
						"<div class='info'><span class='title'>"+data.distance[i].co_name+
						"</span> <strong class='point search_point'>"+data.distance[i].grade+
						"</strong><p class='etc'>"+data.distance[i].location+
						"</p><p class='etc'>"+distance+"m</p></div></figure></div></li>"					
			}
			$("#list").append(truckList);
		});
	}
	
	return {
		list : list,
		moreList : moreList
	}

})();
