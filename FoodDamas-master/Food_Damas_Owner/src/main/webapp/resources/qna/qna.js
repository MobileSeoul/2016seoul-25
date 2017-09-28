/*Created by BitCamp on 2016-07-08.*/

//즉시실행함수
var qnaManager= function(){	
/*	var url0="http://14.32.7.115:55050/";*/
	
	function BoardList(u_id,page,callback){	

		
		var qnajson =$.getJSON('/list/'+ u_id+"?page="+page, callback);	}
	
		
	function AnswerList(qno,callback){	
        var answerjson =$.getJSON('answer/'+ qno , callback);	}
	

	function Insert(obj, callback){
		$.ajax({
			url: 'registeranswer',
			type:"post",
			data:obj,
			success:callback
		});
	}
	
	function Delete(obj, callback){
		$.ajax({
			url: '/deleteanswer',
			type:"get",
			data:obj,
			success:callback
		});
	}
	
	function Update(obj, callback){
		$.ajax({
			url: 'updateanswer',
			type:"post",
			data:obj,
			success:callback
		});
	}
	var formatDate = function(date) {
		var dateObj = new Date(date);
		var yyyy = dateObj.getFullYear();
		var mm = (dateObj.getMonth() + 1).toString(); // getMonth() is zero-based
		mm = mm.lenght > 1 ? mm:'0'+mm;
		var dd = dateObj.getDate().toString();
		dd = dd.length > 1 ? dd : '0'+dd;
		var formatStr = (yyyy) + "/" + (mm) + "/" + dd;
	    //console.log(formatStr);
	    return formatStr;
	};

	
	return{
		BoardList:BoardList,
		AnswerList:AnswerList,
		formatdate : formatDate,
		Insert:Insert,
		Delete:Delete,
		Update:Update
    }
	
}();