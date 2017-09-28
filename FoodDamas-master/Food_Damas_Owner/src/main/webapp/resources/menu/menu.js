/**
 * Created by KWON on 2016-09-01.
 */
/*메뉴부분 js입니당!!*/

var menuManager = function() {
    //list뿌려주는 곳
	function menuListAll(u_id, callback){
        $.getJSON('all/'+u_id, callback);
    }
    //insert해주는 곳
    function menuAdd(obj, callback){
    	$.ajax({
    		url : 'insert',
    		type : "POST",
    		processData:false,
    		contentType:false,
    		data : obj,
    		success : callback
    	});
    }
    //update
    function menuUpdate(obj2, callback){
    	console.log("얌마");

    	console.log(obj2);
    	$.ajax({
    		url : 'update',
    		type : "POST",
    		processData:false,
    		contentType:false,
    		data : obj2,
    		success : callback
    	});
    
    	
    }
    //delete
    function menuDelete(obj3, callback){
    	$.ajax({
			url: 'deleteFile',
			type : "POST",
			data : obj3,
			success : callback
		});	
    }
    //button on/off
    function stateUpdate(obj4, callback){
        $.ajax({
          url: 'updateState',
          type : "POST",
          data : obj4,
          success : callback
       });
    }
    
    return{
        menuListAll : menuListAll,
        menuAdd : menuAdd,
        menuUpdate : menuUpdate,
        menuDelete : menuDelete,
        stateUpdate : stateUpdate
    }
}();