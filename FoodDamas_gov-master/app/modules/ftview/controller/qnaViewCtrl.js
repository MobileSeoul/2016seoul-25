/**
 * Created by Mr_Quang on 9/30/2016.
 */
view.controller("qnaViewCtrl",function($http,$state, $scope,$cookies,$resource,appSettings,ModalService){
    var vm = this;
    var apiBase = appSettings.apiBase;
    $scope.search = "";
    $scope.pageSize = 3;
    vm.orderByField = '';
    vm.reverseSort = false;
    vm.viewDetail = false;
    vm.createNewQuestion =false;
    vm.getListQnA = function () {
        var myQnARecords = $resource(apiBase + '/listQuestion2');
        var myQnARecord = myQnARecords.query(function () {
            //console.dir(myQnARecord);
            vm.lisQnA = myQnARecord;
        });
    }
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
    vm.viewQnADetail = function (data) {

        vm.viewDetail = true;
        vm.getQnA = data;
        if (vm.getQnA.answer != null) {
            $scope.editAnswer = vm.getQnA.answer.ans_content;
        }
    };
    vm.checkFTLogin = function(){
        if(!$cookies.get("foodtruckUser"))
        {
            $state.go("home.login");
        }
        else {
            vm.createNewQuestion =true;
        }
    }
    vm.createQuestion =function()
    {   console.dir(vm.newQuestion);
        vm.createNewQuestion=true;
        var user =$cookies.get("foodtruckUser");
        console.dir(vm.newQuestion.title);
        console.dir(vm.newQuestion.questionContent);
        var mySubmit =$resource(apiBase + '/createQuestion');
        var myResult = mySubmit.get({title:vm.newQuestion.title,content:vm.newQuestion.questionContent,user:user},function () {
            if(myResult.result=="success")
            {
                $state.reload();
            }
        });


    }
    vm.getListQnA();
    //console.log("qna view for food truck owner ctrl ............");
});