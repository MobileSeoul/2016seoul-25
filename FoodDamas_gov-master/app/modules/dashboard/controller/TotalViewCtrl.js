/**
 * Created by Mr_Quang on 10/8/2016.
 */
dashboard.controller("TotalViewCtrl",function($scope,$location,$anchorScroll,dashboardService,$state,ModalService,$mdDateLocale){
    var vm = this;
    $scope.totalviewpageSize =5;
    {
        vm.dateClick= function()
        {
            //console.dir(moment(vm.myDate).format('YYYY-MM-DD'));
            vm.getListTotalByDate(moment(vm.myDate).format('YYYY-MM-DD'));
        }
        vm.myDate = new Date();
        vm.maxDate = new Date();
        $mdDateLocale.formatDate = function(date) {
            return moment(date).format('YYYY-MM-DD');
        };
        vm.getListTotalByDate = function(data)
        {
            var param =
            {
                date : data
            }
            dashboardService.getTotalListByDate(param).then(function(data)
            {
                vm.totalDate = data;
                if(vm.totalDate !='')
                {
                    vm.showTotal(data);
                }
            })
        }
        vm.showTotal = function(data)
        {
            var bounds = new google.maps.LatLngBounds();
            var mapOptions = {
                zoom: 12,
                center: new google.maps.LatLng(37.547572,126.993733),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }


           var map = new google.maps.Map(document.getElementById('map'), mapOptions);

            var location =[];
            for(var i=0;i<data.length;i++)
            {
                var tempArr = [];
                tempArr.push(data[i].u_id);
                tempArr.push(data[i].lat);
                tempArr.push(data[i].lng);
                location.push(tempArr);
            }

            var infoWindow = new  google.maps.InfoWindow();
            var marker;
            for(var i=0;i<location.length;i++)
            {
               /* console.dir(location[i][1]+","+location[i][2]);*/
                var position =new google.maps.LatLng(location[i][1],location[i][2]);
                bounds.extend(position);
                marker = new google.maps.Marker({
                    position: position,
                    map:map
                });
                google.maps.event.addListener(marker,'click',(function(marker,i){
                    return function(){
                        infoWindow.setContent(location[i][0]);
                        infoWindow.open(map,marker);
                    }
                })(marker,i));
                map.fitBounds(bounds);
            }
            var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
                this.setZoom(14);
                google.maps.event.removeListener(boundsListener);
            });
        }


        vm.getListTotalByDate(moment(vm.myDate).format('YYYY-MM-DD'));
        /* vm.getListTotalByDate("2016-09-21");*/

    }
    //console.dir("Total View........");
});