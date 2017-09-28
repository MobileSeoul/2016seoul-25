var homeManager = (function() {
   var truckList = "";
   var gradeList = "";
   var reviewList = "";
var local="http://14.32.7.115:4449/";
   //var local="http://localhost/";

   function getPosition(data, callback) {
      //console.log("*********");
      //console.log(data);
      //console.log("*********");
      
      console.log("------------------------");
      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
/*      if (navigator.geolocation) {
         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도
            
             
            var positionData = new Object();
            positionData.lat = lat;
            positionData.lng = lng;
 
            positionData.page = data.page;      
            positionData.orderBy = data.orderBy; 
            getList(positionData);
          
         });

      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
         console.log("Geolocation 사용 불가");
      }*/
	   //////////////////////공갈 geolocation/////////////////////////////
       var positionData = new Object();
       positionData.lat = 37.494612;
       positionData.lng = 127.027515;

       positionData.page = data.page;      
       positionData.orderBy = data.orderBy; 
       getList(positionData);
   }

   function getList(data, callback) {
      console.log("------getList Data-------");
      console.log(data);
      var orderBy = data.orderBy;
      console.log(orderBy);
      var page = data.page;
      if (data.page == null) {
         data.page = 0;
      }

      $.getJSON(local+'home/'+orderBy+'/' + data.page, data, function(data) {
    	 console.log("--------Get json Data-----");
         console.log("page는 ");
         console.log(page);
         console.log(data);
         //map(data);

         // 좌표값이 없는 경우
         if (data == null) {
            console.log("No data");
            var data = new Object();
            data.page = 0;
            data.lng = 37.493488;
            data.lat = 127.028148;
         }
         if(page==0){
            truckList = "";
         }
         // list up
         for (var i = 0; i < data.result.length; i++) {
        	var state=data.result[i].sales_state;
        	var distance;
        	var co_name;
        	  if(data.result[i].review_num==null){
                  data.result[i].review_num=0;
               }
        	if(state==false){
        		distance = "<p class='etc' style='color:red'>영업종료</p>"   
        		co_name="<span class='title' style='text-decoration:line-through'>"
                  + data.result[i].co_name + " (" 
                  + data.result[i].review_num
                  + ")</span> ";
        	}else{
        		co_name="<span class='title' >"
                    + data.result[i].co_name + " (" 
                    + data.result[i].review_num
                    + ")</span> ";
        		 distance = data.result[i].distance * 10000;
                 distance = "<p class='etc'>"
                 + distance.toFixed(1) + " M</p>"
        	}
          
            var grade=data.result[i].grade.toFixed(1);
     
            truckList +="<li class='restaurant-item' id='storeList' " 
                +"data-co_name='"+data.result[i].co_name+"' data-sno='"+data.result[i].sno+"' data-u_id='"+data.result[i].u_id+"'><div class='popular_restaurant_inner_wrap'><figure class='restaurant-item'>"
            	  +"<div class='thumb' style='background-image: url(http://14.32.7.115:4040/displayProfile?fileName="+ data.result[i].u_profile_img+")'></div>"
                  + "<div class='info'>"+co_name+"<strong class='point search_point'>"
                  + grade
                  + "</strong><p class='etc'>"
                  + data.result[i].location
                  + "</p>"+distance+"</div></figure></div></li>"
         }
         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         ///////////////////////////////////////////이가영이가영이가영이가영이가영이가영///////////////////////////////////////////////////////
         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
          $("#list").on("click","#storeList", function() {        	  
            var $this=$(this);
            var u_id=$this.attr("data-u_id");
            var sno=$this.attr("data-sno");
            var co_name=$this.attr("data-co_name");
            sessionStorage.setItem('sno', sno);
            sessionStorage.setItem('co_name', co_name);
            sessionStorage.setItem('u_id', u_id);//세션생성_Leeek
            var obj={
                  u_id: u_id,
                  sno: sno
            };
            window.location.replace(local+"menu/menulist");
         });
          
          $("#gradeList").on("click","#storeList", function() {        	  
              var $this=$(this);
              var u_id=$this.attr("data-u_id");
              var sno=$this.attr("data-sno");
              var co_name=$this.attr("data-co_name");
              sessionStorage.setItem('sno', sno);
              sessionStorage.setItem('co_name', co_name);
              sessionStorage.setItem('u_id', u_id);//세션생성_Leeek
              var obj={
                    u_id: u_id,
                    sno: sno
              };
              window.location.replace(local+"menu/menulist");
           });
          
          $("#reviewList").on("click","#storeList", function() {        	  
              var $this=$(this);
              var u_id=$this.attr("data-u_id");
              var sno=$this.attr("data-sno");
              var co_name=$this.attr("data-co_name");
              sessionStorage.setItem('sno', sno);
              sessionStorage.setItem('co_name', co_name);
              sessionStorage.setItem('u_id', u_id);//세션생성_Leeek
              var obj={
                    u_id: u_id,
                    sno: sno
              };
              window.location.replace(local+"menu/menulist");
           });

           ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          
         $("#list").html(reviewList);
         console.log("order BY-----------");
         console.log(orderBy);
         switch(orderBy){
            case "distance":
               $("#list").html(truckList);
               break;
               
            case "grade":
               $("#gradeList").html(truckList);
               break;
               
            case "review":
               $("#reviewList").html(truckList);
               break;
               
       
      }

      });
   }
   
   
  
   
   function map(data, callback) {
       console.log("----map data-----");
       console.log(data);
       

      var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
      var options = { // 지도를 생성할 때 필요한 기본 옵션
         center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표.
         level : 6
      // 지도의 레벨(확대, 축소 정도)
      };

      var map = new daum.maps.Map(container, options); // 지도 생성 및 객체 리턴

      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
/*      if (navigator.geolocation) {
         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도

            var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될
            // 위치를
            // geolocation으로
            // 얻어온 좌표로
            // 생성합니다
            message = '<div style="padding:5px;">My Position</div>'; // 인포윈도우에
            // 표시될
            // 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

         });

      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

         var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

         displayMarker(locPosition, message);
      }*/
      
      ////////////////////////////////////////////////공갈 로케이션/////////////////////////////////////////////////////
      var lat = 37.494612, // 위도
      lon =127.027515; // 경도


      var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될
      // 위치를
      // geolocation으로
      // 얻어온 좌표로
      // 생성합니다
      message = '<div style="padding:5px;">My Position</div>'; // 인포윈도우에
      // 표시될
      // 내용입니다

      // 마커와 인포윈도우를 표시합니다
      displayMarker(locPosition, message);

      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message) {

         // 마커를 생성합니다
         var marker = new daum.maps.Marker({
            map : map,
            position : locPosition
         });

         var iwContent = message, // 인포윈도우에 표시할 내용
         iwRemoveable = true;

         // 인포윈도우를 생성합니다
         var infowindow = new daum.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
         });

         // 인포윈도우를 마커위에 표시합니다
         infowindow.open(map, marker);

         // 지도 중심좌표를 접속위치로 변경합니다
         map.setCenter(locPosition);
      }

      // 마커를 표시할 위치와 title 객체 배열입니다
      var positions = new Array;
      for (var i = 0; i < data.result.length; i++) {
         var lat = positions.push({
            title : data.result[i].co_name,
            latlng : new daum.maps.LatLng(data.result[i].lat,
                  data.result[i].lng)
         });
      }
      
      //truckMapList(positions);

      // 마커 이미지의 이미지 주소입니다
      var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

      for (var i = 0; i < positions.length; i++) {
         // 마커 이미지의 이미지 크기 입니다
         var imageSize = new daum.maps.Size(24, 35);

         // 마커 이미지를 생성합니다
         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

         // 마커를 생성합니다
         var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage
         // 마커 이미지
         });
      }

   }

   return {
      getPosition : getPosition,
      map : map,
      getList : getList
   }

})();