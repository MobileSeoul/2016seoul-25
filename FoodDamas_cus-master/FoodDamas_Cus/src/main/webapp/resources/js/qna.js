
//즉시실행함수
var QnaManager= function(){	
	
	var local="http://14.32.7.115:4449/";

	function QnaList(u_id,c_id,page,callback){	
		var qnajson =$.getJSON(local+'/qna/'+ u_id+"/"+ c_id+"?"+"page=" + page, callback);	

	}
	
	function AnswerList(qno,callback){	
        var answerjson =$.getJSON(local+'answer/'+ qno , callback);	
	}
	
	
	function Insert(obj, callback){
		$.ajax({
			url: local+'registerqna',
			type:"post",
			data:obj,
			success:callback
		});
	}

	
	function Delete(obj, callback){
		$.ajax({
			url: local+'deleteqna',
			type:"get",
			data:obj,
			success:callback
		});
	}
	
	
	return{
		QnaList:QnaList,
		AnswerList:AnswerList,
		
		Insert:Insert,
		Delete:Delete
		
    }
	
}();//즉시실행


/**/