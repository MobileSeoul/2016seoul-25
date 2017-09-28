/**
 * Created by Mr_Quang on 9/5/2016.
 */
var OrderModule = (function() {
	var u_id="";
	var showDialog = function() {
		$.tips('Toast Message', 5000);
	};
	//constructor
	var OrderModule = function(id){
		u_id =id;
	}
	var printTest = function(){
		console.log(u_id);
	}
	var getData = function(string="") {	
		$.ajax({
			url : "order/listOrderBySaleID",
			type : 'get',	
			data : {uid:u_id},
			dataType : 'json',
			success : function(data) {
			
				var divsection1 = document.getElementById("showSection1");
				if(!$.trim(data) ||data.length ==0){
					
					divsection1.innerHTML = "No Order Receive";
				}else{
					
				
				var searchData = [];			
				if(string ===""||string==null){
					divsection1.innerHTML = showHTML(data);
				}
				else
				{
					for (var i = 0; i < (data.length); i++) {
						if(data[i].c_msg ==null||data[i].c_msg =="" )
						{
							if(data[i].ono == string
									||checkString(data[i].c_id,string))
							{
								searchData.push(data[i]);
							}
						}else
						{
							if(checkString(data[i].c_msg,string)
									|| data[i].ono == string
									||checkString(data[i].c_id,string))
							{
								searchData.push(data[i]);
							}
						}
						
					}					
					divsection1.innerHTML = showHTML(searchData);
				}	
				
				if(data.length>2)
				{
					$(".s1").height("45em");
					var swiper = new Swiper('.s1', {
						pagination: '.swiper-pagination1',
						loop: true,						
						keyboardControl: true,
						paginationClickable: true,
						paginationBulletRender: function (index, className) {
						    return "<span class='" + className + "'>" + (index + 1) + "</span>";
						}
					});
				}	
				}
			},
			error : function() {
				alert("fail to get data");
			}
		});
	};
	// tab finish
	var orderFinished = function() {
		$.ajax({
			url : 'order/listOrderFinished',
			type : 'get',
			data : {uid:u_id},
			dataType : 'json',
			success : function(data) {
				var divsection2 = document.getElementById("showSection2");
				if (!$.trim(data)) {
					divsection2.innerHTML = "No Order Finished!";
				} else {
					divsection2.innerHTML = showFinishOrder(data);	
				}
				if(data.length>2)
				{
					$(".s2").height("40em");
					var swiper1 = new Swiper('.s2', {
					    pagination: '.swiper-pagination2',
						loop: true,
						paginationClickable: true,
						paginationBulletRender: function (index, className) {
						    return "<span class='" + className + "'>" + (index + 1) + "</span>";
						}
					});
				}				
				
			},	
			error : function() {
				alert("fail to get data");
			}
		});
	};
	var checkString = function(str1,str2){
		var check = false;		
		if(str1.toUpperCase().indexOf(str2.toUpperCase())>=0)
		{
			check = true;
		}
		return check;
	};	
	var getLatLog = function(checkvalue){		
		if(checkvalue == 1)
		{
			checkLocation();
		}
		else{
			
			closeTruck();
		}	   
	};
	var closeTruck = function(){
	   $.ajax({
			url : "closeTruck",
			type : 'get',	
			data : {uid:u_id},
			success : function(data) {
				if(data =="success"){
					//alert("send");
				}
			},
			error : function() {
				alert("fail to send data");
			}
		});
	}
	var checkLocation = function(){		
		 if (navigator.geolocation) {					
		    	navigator.geolocation.getCurrentPosition(function(position){
		    		 var latlng = position.coords.latitude+","+position.coords.longitude;		 
		    		 var url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" + latlng + "&sensor=false&language=ko";
		    		 $.getJSON(url, function (data) {			
		    			 	setLocation(position.coords.latitude,position.coords.longitude,
		    			 			data.results[0].formatted_address);
		    		 });	
		    	},showError);
			} else {
			    console.log("Geolocation is not supported by this browser.");
			}	
	};

	var setLocation = function(lat,lng,address){	
		$.ajax({
			url : "updateLocation",
			type : 'post',	
			data : {uid:u_id,lat:lat,lng:lng,address:address},
			success : function(data) {
				if(data =="success"){
					//alert("send");
				}
			},
			error : function() {
				alert("fail to send data");
			}
		});
	};
	
	
	var showError = function(error){
		 switch(error.code) 
		    {
		    case error.PERMISSION_DENIED:
		      x.innerHTML="User denied the request for Geolocation."
		      break;
		    case error.POSITION_UNAVAILABLE:
		      x.innerHTML="Location information is unavailable."
		      break;
		    case error.TIMEOUT:
		      x.innerHTML="The request to get user location timed out."
		      break;
		    case error.UNKNOWN_ERROR:
		      x.innerHTML="An unknown error occurred."
		      break;
		    }
	}
	var showHTML = function(data) {
		var html = "";
		html += "<div class='swiper-container s1'>";
			html +=	"<div class='swiper-wrapper'>";
			for (var i = 0; i < (data.length); i+=4) {
				html +="<div class='swiper-slide'>";
					html += gethtml(data[i], i);
					html += gethtml(data[i+1], i+1);
					html += gethtml(data[i+2], i+2);
					html += gethtml(data[i+3], i+3);
				html +="</div>";				
			}
			html+="</div>";
			html+="<div class='swiper-pagination swiper-pagination1' ></div>";
		html+="</div>";
		
		return html;
	};
	var isRealValue = function(obj) {
		return obj && obj !== 'null' && obj !== 'undefined';
	}

	var gethtml = function(data, seq) {
		var html = "";
		if (isRealValue(data)) {
			html += "<div id='order" + data.ono
					+ "' class='container orderpanel'>";
			html += "<div class='col-xs-1 col-sm-1'>";
			html += "<span>" + (seq + 1) + "</span>";
			html += "</div>";
			html += "<div class='col-xs-12 col-md-11'>";
			//new edit
			html += "<div>";
			html += "<div class='col-xs-12 col-md-12 btn_state' style='margin-bottom:5px;'>"
			html += "Order #"+data.ono;
			html +="</div>";
			html += "</div>";
			//end new edit
			html += "<div class='row'>";
			html += "<div class='col-xs-3 col-sm-3 col-md-2'>";
			html += "<span>메뉴:</span>";
			html += "</div>";
			html += " <div class='col-xs-8 col-sm-8 col-md-8'>";
			for (var t = 0; t < (data.listOrderDetail).length; t++) {
				html += "<span>" + data.listOrderDetail[t].menu.m_name + " x "
						+ data.listOrderDetail[t].quantity + "</span>";
				
				if(t < ((data.listOrderDetail).length-1))
				{
					html += ", ";
				}
			}
			html += "</div>";
			
			html += "</div>";// finish row
			//new edit
			html +="<div class='row'>";
			html += "<div class='col-xs-3 col-sm-3 col-md-2 '>";
			html += "<span>OrderBy:</span>";
			html += "</div>";
			html += "<div class='col-xs-8 col-md-8'>";
			html += "<span>"+data.c_id+"</span>";
			html +="</div>";
			html +="</div>";//end row
			//end new edit
			html += "<div class='row'>";// begin new row
			html += "<div class='col-xs-3 col-sm-3 col-md-2 '>";
			html += "<span>메모:</span>";
			html += "</div>";
			// div customer comment
			if (data.c_msg == "" || data.c_msg == null) {
				html += "<div class='col-xs-8 col-md-8'>";
				html += "<span>No Comment</span>";
			} else {
				html += "<div class='col-xs-5 col-md-8'>";
				html += "<span>" + data.c_msg + "</span>";

			}
			html += "</div>";
			if (data.c_msg == "" || data.c_msg == null) {
			} else {
				html += "<div class='col-xs-4 col-md-2 text-right'>";
				var id = "$('#content" + data.ono + "').toggle();";
				html += "<span><a id='btnMore" + data.ono + "' onclick=" + id
						+ ">[더보기]</a></span>";
				html += "</div>";
				// div comment
				html += "<div class='col-xs-12 col-md-12' id='content"
						+ data.ono + "'" + " style='display:none;'>";
				html += "<span>" + data.c_msg + "</span>";
				html += "</div>";
			}
			html += "</div>"// end row

			// check Order State Here
			var statecode = data.state.state_code;
			if (statecode == 10) {
				html += notCook(data.ono);

			}
			if (statecode >= 11 && statecode <= 13) {
				html += finishCook(data.ono);
			}
			if (statecode == 15) {
				html += finishOrder(data.ono);
			}
			html += "</div>";// end div
			html += "</div>";
		}

		return html;
	}
	

	
	// tab finish
	var showFinishOrder = function(data) {
		var html = "";
		html += "<div class='swiper-container s2'>";
			html +=	"<div class='swiper-wrapper'>";
			for (var i = 0; i < (data.length); i+=4) {
				html +="<div class='swiper-slide'>";
					html += htmlFinishOrder(data[i], i);
					html += htmlFinishOrder(data[i+1], i+1);
					html += htmlFinishOrder(data[i+2], i+2);
					html += htmlFinishOrder(data[i+3], i+3);
				html +="</div>";				
			}
			html+="</div>";
			html+="<div class='swiper-pagination swiper-pagination2' ></div>";
		html+="</div>";
		return html;
	};
	var htmlFinishOrder = function(data,seq)
	{
		var html ="";
		if (isRealValue(data)) 
		{
			html += "<div id='orderFinish" + data.ono
			+ "' class='container orderpanel'>";
			html += "<div class='col-xs-1 col-sm-1'>";
			html += "<span>" + (seq+1) + "</span>";
			html += "</div>";
			html += "<div class='col-xs-12 col-md-11'>";
			//new edit
			html += "<div>";
			html += "<div class='col-xs-12 col-md-12 btn_state' style='margin-bottom:5px;'>"
			html += "Order #"+data.ono;
			html +="</div>";
			html += "</div>";
			//end new edit
			html += "<div class='row'>";
			html += "<div class='col-xs-3 col-sm-3 col-md-2'>";
			html += "<span>메뉴:</span>";
			html += "</div>";
			html += " <div class='col-xs-8 col-sm-8 col-md-8'>";
			for (var t = 0; t < (data.listOrderDetail).length; t++) {
				html += "<span>" + data.listOrderDetail[t].menu.m_name
						+ " x " + data.listOrderDetail[t].quantity
						+ "</span>";
				html += "<br/>";
			}
			html += "</div>";			
			html += "</div>";// finish row
			//new edit
			html +="<div class='row'>";
			html += "<div class='col-xs-3 col-sm-3 col-md-2 '>";
			html += "<span>Total:</span>";
			html += "</div>";
			html += "<div class='col-xs-8 col-md-8'>";
			html += "<span>"+data.total_price+"</span>";
			html +="</div>";
			html +="</div>";//end row
			//new edit
			html +="<div class='row'>";
			html += "<div class='col-xs-3 col-sm-3 col-md-2 '>";
			html += "<span>OrderBy:</span>";
			html += "</div>";
			html += "<div class='col-xs-8 col-md-8'>";
			html += "<span>"+data.c_id+"</span>";
			html +="</div>";
			html +="</div>";//end row
			
			//end new edit
			html += "<div class='row'>";// begin new row
			html += "<div class='col-xs-3 col-sm-3 col-md-2 '>";
			html += "<span>메모:</span>";
			html += "</div>";
			// div customer comment
			if (data.c_msg == "" || data.c_msg == null) {
				html += "<div class='col-xs-8 col-md-8'>";
				html += "<span>No Comment</span>";
			} else {
				html += "<div class='col-xs-5 col-md-8'>";
				html += "<span>" + data.c_msg + "</span>";
		
			}
			html += "</div>";
			if (data.c_msg == "" || data.c_msg == null) {
			} else {
				html += "<div class='col-xs-4 col-md-2 text-right'>";
				var id = "$('#content" + data.ono + "').toggle();";
				html += "<span><a id='btnMore" + data.ono + "' onclick=" + id
						+ ">[더보기]</a></span>";
				html += "</div>";
				// div comment
				html += "<div class='col-xs-12 col-md-12' id='content"
						+ data.ono + "'" + " style='display:none;'>";
				html += "<span>" + data.c_msg + "</span>";
				html += "</div>";
			}
			html += "</div>"// end row
			html += "</div>";// end div
			html += "</div>";
		}
		return html;
	};

	var orderUpdateState = function(id, state) {
		var ono = id;
		$.ajax({
			url : "order/updateState",
			type : 'post',	
			data : {
				oid : ono,
				ostate : state
			},
			success : function(data) {
				
				console.log(data);
				getData();
				if(state == "pickup"){
					orderFinished();
				}
			},
			error : function() {
				alert("fail to send data");
			}
		});
	};
	var btnClick = function(id) {
		/*
		 * $("#section1").on("click","input[type='radio']", function(e){
		 * alert($(this).val()); });
		 */
		$("#section1").on("click", "input[name=choosetime" + id + "]",
				function(e) {
					orderUpdateState(id, $(this).val());
				});
		$("#section1").on("click", "#btnCancel" + id, function(e) {
			orderUpdateState(id, "cancel");
		});
		$("#section1").on("click", "#FinishFoodBtn" + id + "", function(e) {
			orderUpdateState(id, "finish");
		});
		$("#section1").on("click", "#DeliveryFood" + id + "btn", function() {
			orderUpdateState(id, "pickup");
		});
	}
	var notCook = function(id) {
		var html = "";
		html += "<div id='chooseTime" + id + "'>";
		html += "<div class='col-xs-8 col-md-8 stateDiv'>";
		html += "<div class='col-xs-12 btn_state'>";
		html += "<div class='col-xs-4'>";
		html += "<label class='radio-inline'>";
		html += "<input type='radio' name='choosetime" + id + "' value='5분'>5'";
		html += "</lable>";
		html += "</div>";
		html += "<div class='col-xs-4'>";
		html += "<label class='radio-inline'>";
		html += "<input type='radio' name='choosetime" + id
				+ "' value='10분'>10'";
		html += "</lable>";
		html += "</div>";
		html += "<div class='col-xs-4'>";
		html += "<label class='radio-inline'>";
		html += "<input type='radio' name='choosetime" + id
				+ "' value='30분'>30'";
		html += "</lable>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "<div class='col-xs-4 col-md-4 stateDiv'>";
		html += "<a id='btnCancel" + id + "'>";
		html += "<p class='btnCancel'>취소</p>";
		html += "</a>";
		html += "</div>";
		html += "</div>";

		btnClick(id);

		return html;
	};

	var finishCook = function(id) {
		var html = "";
		html += "<div id='FinishFood" + id + "' ";
		html += "style='margin-top:5px;'";
		html += "class='stateDiv btn_state'>";
		html += "<a id='FinishFoodBtn" + id + "' >";
		html += "<p>";
		html += "Food Finish";
		html += "</p>";
		html += "</a>";
		html += "</div>";
		btnClick(id);
		return html;
	};
	var finishOrder = function(id) {
		var html = "";
		html += "<div id='DeliveryFood" + id + "' ";
		html += "style='margin-top:5px;'";
		html += "class='stateDiv btn_state'>";
		html += "<a id='DeliveryFood" + id + "btn'>";
		html += "<p>";
		html += "Pick Up";
		html += "</p>";
		html += "</a>";
		html += "</div>";
		btnClick(id);
		return html;
	};

	var formatDate = function(date) {
		var dateObj = new Date(date);
		var yyyy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();
		var formatStr = (yyyy) + "/" + (mm) + "/" + dd;
		console.log(formatStr);
	};
	
	var setSwitch = function(){
		//console.log("set Switch"+id+".......................");
		var test;
		try{
			$.ajax({
				 async: false,
				url : "getState",
				type : 'get',	
				data : {uid:u_id},
				success : function(data) {
					//console.log(data);
					test =data;
				},
				error : function() {
					alert("fail to send data");
				}
			});
		}catch(error){
			error.message;
		}
	
		return test;
	};
	
	OrderModule.prototype ={
		constructor : OrderModule,
		print :printTest,
		showDialog : showDialog,
		getData : getData,
		orderFinished : orderFinished,
		update : orderUpdateState,
		dateFormat : formatDate,
		getPosition : getLatLog,
		setSwitch :setSwitch
	}
/*	return {
		show : showDialog,
		get : getData,
		orderFinished : orderFinished,
		update : orderUpdateState,
		dateFormat : formatDate,
		getPosition : getLatLog,
		setSwitch :setSwitch,
	
 
	};*/
	return OrderModule;
}());
