/**
 * Created by Mr_Quang on 9/30/2016.
 */
view.controller("noticeViewCtrl",function($http, $scope,$resource,appSettings){
    var vm = this;
    var apiBase = appSettings.apiBase;
    vm.noticeDetail =false;
    vm.getListNotice = function () {
        var myNoticeRecords = $resource(apiBase + '/listnotice');
        var myNoticeRecord = myNoticeRecords.query(function () {
            //console.dir(myNoticeRecord);
            vm.noticeResult = myNoticeRecord;
        });
    }
    vm.getListNotice();
    vm.noticeClick = function(data){
        vm.noticeDetail =true;
        vm.detailResult = data;
        //console.dir(data);
    }
    //console.log("notice view for food truck owner ctrl ............");
});