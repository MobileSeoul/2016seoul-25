
//즉시실행함수
var ApiManager= function(){	
 
	function ApiCount(callback){	//카운트 가져오는 부분
		$.getJSON('http://openapi.seoul.go.kr:8088/41724c556c62657534335764474f62/json/PublicParkingAvaliable/1/1000', callback);	

	}
	
	
	

	function ApiList(callback, start, end){	//데이타 가져오는 부분
		var link="http://openapi.seoul.go.kr:8088/41724c556c62657534335764474f62/json/PublicParkingAvaliable/"
		$.getJSON(link+start+"/"+end+"/", callback);	
	}

	
	return{
		ApiCount:ApiCount,
		ApiList:ApiList
		
    }
	
}();//즉시실행


/**/