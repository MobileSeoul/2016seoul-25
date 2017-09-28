/*Created by BitCamp on 2016-07-08.*/

//즉시실행함수
var cartManager= function(){	
	var local="http://14.32.7.115:4449/";

	
	function cartList(c_id,callback){	

		var qnajson =$.getJSON(local+'store/cartList/'+ c_id, callback);	
		}
	
	function quantity(obj, callback){
		$.ajax({
			url: local+'store/quantity',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			type:"put",
			data:JSON.stringify(obj), 
			success:callback
		});
	}
	
	function deleteCart(cno, callback){
		$.ajax({
			url: local+'store/deleteCart',
			type:"delete",
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			data:cno,
			success:callback
		});
	}
	
	function insertOrder(obj){
		console.log("---------------------");
		console.log(obj);
		$.ajax({
			url: local+'order/insertOrder',
			type:"post",
			data:JSON.stringify(obj),
			 contentType: 'application/json',
			success: function(data) {
				console.log(data);
				if(data=='fail'){
					alert("주문에 실패하였습니다. 다시 주문해주세요")
					window.location.replace("/store/cart");
				}else{
					alert("주문에 성공하였습니다. 조금만 기다려 주세요!")
					window.location.replace("/order/orderlist");
				}
			}
		});
	}
	
	
	return{
		cartList:cartList,
		quantity:quantity, //수량 수정
		deleteCart : deleteCart,
		insertOrder: insertOrder//삭제
    }
	
}();//즉시실행


/**/