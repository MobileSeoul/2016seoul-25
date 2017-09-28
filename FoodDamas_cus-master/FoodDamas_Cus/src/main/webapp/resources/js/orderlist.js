
//즉시실행함수
var OrderListManager= function(){	
	var local="http://14.32.7.115:4449/";

	function OrderList(c_id,page,callback){	
		$.getJSON(local+'order/orderlist/'+ c_id+"?"+"page=" + page, callback);	

	}
	
	return{
		OrderList:OrderList
		
    }
	
}();//즉시실행


/**/