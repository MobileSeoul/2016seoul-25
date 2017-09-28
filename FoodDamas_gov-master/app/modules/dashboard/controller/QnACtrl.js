/**
 * Created by Mr_Quang on 9/24/2016.
 */
dashboard.controller("QnACtrl", qnaFunction);

function qnaFunction($scope, $location, dashboardService, $cookies, $state, ModalService) {
    /*----------------Init Concept---------------------*/
    {
        var vm = this;
        $scope.search = "";
        $scope.pageSize = 3;
        $scope.currentPage = 1;

        /*  $scope.init =function(){
         console.log("init..................");
         vm.testFunc();
         }*/
        vm.createQnA = false;
        vm.viewDetail = false;
    }
    /*---------------------------Init----------------------*/
    {
        vm.getFunc = function () {
            dashboardService.getListQuesttion().then(function (data) {
                var d = JSON.parse(angular.toJson(data));
                vm.getData = d;
                // console.log(vm.getData);
            });
        };
        vm.getData = vm.getFunc();
    }
    /*----------------- Order By ---------------------------*/
    {
        vm.orderByField = '';
        vm.reverseSort = false;
        vm.orderClick = function (data) {
            if (data == "id") {
                vm.orderByField = "q_id";
            }
            else if (data == "title") {
                vm.orderByField = "q_title";
            } else if (data == "created") {
                vm.orderByField = "q_created";
            } else {
                vm.orderByField = "answer";
            }
            vm.reverseSort = !vm.reverseSort;
        };
    }
    /*get Question vs Ans Detail*/
    {
        vm.getQnA = {};
        var ansEditTemp = "";
        vm.viewQnADetail = function (data) {
            $location.hash("viewDetail")
            vm.viewDetail = true;
            vm.getQnA = data;
          /*  console.log(vm.getQnA);*/
            if (vm.getQnA.answer != null) {
                $scope.editAnswer = vm.getQnA.answer.ans_content;
            }
        };
    }
    /*Add Answer For Question*/
    {
        vm.addAnswer = function () {
            var param = {
                q_id: vm.getQnA.q_id,
                ans_content: $scope.AnswerContent,
                ans_user: $cookies.get("user")
            }
            dashboardService.createAnswer(param).then(function (data) {
                if (data.result == "success") {
                   /* console.log("-------Reload---------------");*/
                    $state.reload();
                }

            });
        };
    }
    /*Edit Answer Part*/
    {
        vm.editAnswer = false;
        vm.saveEditAnswer = function () {
            var answer =
            {
                ans_id: vm.getQnA.answer.ans_id,
                ans_content: $scope.editAnswer
            };
            dashboardService.editAnswer(answer).then(function (data) {
                if (data.result == "success") {
                    vm.editAnswer = false;
                    $state.reload();
                }
            });
        };
    }
    /*Delete Answer*/
    {
        vm.showModal = function () {
            ModalService.showModal({
                templateUrl: 'modal.html',
                controller: "ModalController"
            }).then(function (modal) {
                modal.element.modal();
                modal.close.then(function (result) {
                    if (result == "Yes") {
                        var param = {
                            ans_id: vm.getQnA.answer.ans_id
                        }
                        dashboardService.deleteAnswer(param).then(function (data) {
                            if (data.result == "success") {
                                $state.reload();
                            }
                        });
                    }
                });
            });
        }
    }
    /*console.log("QnA Page Ctrl.............");*/
}
{
    /*---------------------Modal Controller---------------------*/
    dashboard.controller('ModalController', function ($scope, close) {

        $scope.close = function (result) {
            close(result, 500); // close, but give 500ms for bootstrap to animate
        };

    });
}