
//즉시실행함수
var InfoManager= function(){	
	var local="http://14.32.7.115:4449/";


	function InfoList(u_id,callback){	
		var infojson =$.getJSON(local+'info/'+ u_id, callback);	
		

	}
	
	return{
		InfoList:InfoList,
		
		
    }
	
}();//즉시실행


/**/