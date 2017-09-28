/**
 * Created by Mr_Quang on 9/24/2016.
 */
dashboard.controller("NoticeCtrl",function($scope,$location,$anchorScroll,dashboardService,$state,ModalService){
    var vm =this;

    $scope.pageSize =5;
    vm.viewNoticeDetail=false;
    /*---------------------------Init----------------------*/
    {
        vm.getFunc = function () {
            dashboardService.getlistNotice().then(function (data) {
                var d = JSON.parse(angular.toJson(data));
                vm.getData = d;
            });
        };
        vm.getData = vm.getFunc();
    }
    /*----------------OrderBy------------------------------*/
    {
        vm.sortid =false;vm.sorttitle=false;
        vm.sorttype = false;vm.sortdate=false;
        vm.orderByField = '';
        vm.reverseSort =false;
        vm.sortFunc = function(data){
            switch (data){
                case "id":
                    {
                        vm.sortid =true;
                        vm.sorttitle=false;
                        vm.sorttype = false;
                        vm.sortdate=false;
                        break;
                    }
                case "title":
                    {
                        vm.sortid =false;
                        vm.sorttitle=true;
                        vm.sorttype = false;
                        vm.sortdate=false;
                        break;
                    }
                case "type":
                    {
                        vm.sortid =false;
                        vm.sorttitle=false;
                        vm.sorttype = true;
                        vm.sortdate=false;
                        break;
                    }
                case "date":
                    {
                        vm.sortid =false;
                        vm.sorttitle=false;
                        vm.sorttype = false;
                        vm.sortdate=true;
                        break;
                    }
            }

            vm.orderByField =data;
            vm.reverseSort =!vm.reverseSort;
        }
    }

    vm.noticeEdit =false;
    vm.getNotice ={};
    vm.newNotice ={};
    var temp ={};
    vm.noticeView = function(data){
        vm.viewNoticeDetail =true;
        vm.getNotice =data;
        temp.title = data.title;
        temp.content = data.content;
        temp.type = data.type;
    }
    vm.save = function(data){
        var param ={
            id:data.id,
            title:data.title,
            content:data.content,
            type:data.type
        }
        dashboardService.updateNotce(param).then(function(data){
            if (data.result == "success") {
                $state.reload();
            }
        })
    }
    /*----------------Button Click to create part----------*/
    {
        vm.gotoCreate = function(){
            $location.hash('create');
            $anchorScroll();
        }
    }
    /*Delete Notice*/
    {
        vm.delete = function(data){
            ModalService.showModal({
                templateUrl: 'modal.html',
                controller: "ModalController"
            }).then(function (modal) {
                modal.element.modal();
                modal.close.then(function (result) {
                    if (result == "Yes") {
                        var param = {
                            id: data
                        }
                        dashboardService.deleteNotice(param).then(function(data){
                            if (data.result == "success") {
                                $state.reload();
                            }
                        })
                    }
                });
            });

        };
    }
    /*Create Notice*/
    {
        vm.createNew = function (data) {
            if ('type' in data) {
                var param = {
                    title: data.title,
                    content: data.content,
                    type: data.type
                }
                dashboardService.createNotice(param).then(function (data) {
                    if (data.result == "success") {
                        $state.reload();
                    }
                })
            } else {
                vm.addNoticeError = "Please Select Type For Notice";
            }

        }
    }
    vm.cancelEdit = function(){
        vm.noticeEdit=!vm.noticeEdit;
        vm.getNotice.title = temp.title;
        vm.getNotice.content = temp.content;
        vm.getNotice.type = temp.type;
    }
    /*console.log("Notice Page Ctrl.............");*/
})

{
    /*---------------------Modal Controller---------------------*/
    dashboard.controller('ModalController', function ($scope, close) {

        $scope.close = function (result) {
            close(result, 500); // close, but give 500ms for bootstrap to animate
        };

    });
}