/**
 * Created by Mr_Quang on 10/7/2016.
 */
dashboard.controller("FoodTruckViewCtrl", function ($scope, $location, $anchorScroll, dashboardService, $state, ModalService, $mdDateLocale) {
    var vm = this;
    $scope.ftviewpageSize =10;
    $scope.locationPaging = 5;
    vm.ftDetail = false;

    /*get FT data*/
    {
        vm.changeState = function(data)
        {
            //console.dir(data);
            ModalService.showModal({
                templateUrl: 'modal.html',
                controller: "ModalController"
            }).then(function (modal) {
                modal.element.modal();
                modal.close.then(function (result) {
                    if (result == "Yes") {
                        dashboardService.updateFTState({id:data.u_id,state:data.register_state}).then(function(response){
                            $state.reload();
                        });
                    }
                });
            });

        }
        vm.getListFT =function(){
            dashboardService.getListFTFull().then(function(data){
                //console.dir(data);
                vm.listFTFill = data;
            });
        }
        vm.getListFT();
        vm.rowClick = function(data){
            vm.ftDetail = true;
            vm.setOpen =true;
            vm.ftInfo = data;

            vm.getHistorySale(data.u_id);
        }
        vm.getHistorySale = function(data){
            dashboardService.getHistorySale({data:data}).then(function(response){
                vm.historyResult = response;
              /*  console.dir(vm.historyResult);*/
                if(vm.historyResult!='')
                {
                    vm.showMap(vm.historyResult);
                }
            });
        }
        vm.showMap = function(response)
        {
            var bounds = new google.maps.LatLngBounds();
            var mapOptions = {
                zoom: 16,
                center: new google.maps.LatLng(37.547572,126.993733),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(document.getElementById('HistoryMap'), mapOptions);
            var infoWindow = new  google.maps.InfoWindow();
            var marker;
            for(var i=0;i<response.length;i++){
               /* console.dir(response[i].lat+", "+response[i].lng+", "+response[i].location);*/
                var position =new google.maps.LatLng(response[i].lat,response[i].lng);
                bounds.extend(position);
                marker = new google.maps.Marker({
                    position: position,
                    map:map
                });
                google.maps.event.addListener(marker,'click',(function(marker,i){
                    return function(){
                        infoWindow.setContent(response[i].work_date);
                        infoWindow.open(map,marker);
                    }
                })(marker,i));
                map.fitBounds(bounds);
            }
            var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
                this.setZoom(16);
                google.maps.event.removeListener(boundsListener);
            });
        }
    }

    /*end get FT data*/



    //console.dir("Food Truck View Ctrl.........");
});

{
    /*---------------------Modal Controller---------------------*/
    dashboard.controller('ModalController', function ($scope, close) {

        $scope.close = function (result) {
            close(result, 500); // close, but give 500ms for bootstrap to animate
        };

    });
}