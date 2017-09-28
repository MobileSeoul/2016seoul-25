
//즉시실행함수
var ReviewManager= function(){	
	var local="http://14.32.7.115:4449/";

	function ReviewList(u_id,page,callback){	
		var reviewjson =$.getJSON(local+'review/'+ u_id+"?"+"page=" + page, callback);	

	}
	
	function Insert(obj, callback){
		$.ajax({
			url: local+'registerreview',
			type:"post",
			data:obj,
			success:callback
		});
	}
	
	return{
		ReviewList:ReviewList,
		
		Insert:Insert,
		
    }
	
}();//즉시실행


/**/