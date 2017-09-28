/**
 * Created by KWON on 2016-09-01.
 */
/*메뉴부분 js입니당!!*/

var menuManager = function() {
    //list뿌려주는 곳
	var local="http://14.32.7.115:4449/";

	function menuListAll(u_id, callback){
        $.getJSON(local+'menu/all/'+u_id, callback);
    }
	
	//tbl_cart에 값 집어넣기
    function menucart(obj,callback){
    	$.ajax({
    		url : local+'store/menucart',
    		type : "POST",
    		data : obj,
    		success : callback
    	});
    }
	
	
	
    return{
        menuListAll : menuListAll,
        menucart : menucart
    }
}();