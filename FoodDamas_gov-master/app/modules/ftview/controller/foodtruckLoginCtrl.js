/**
 * Created by Mr_Quang on 10/9/2016.
 */
view.controller("ftLoginCtrl",function($http,$state, $scope,$resource,appSettings,$cookies) {
    var vm =this;
    var apiBase = appSettings.apiBase;
    vm.errorMsg='';
    if($cookies.get("foodtruckUser"))
    {
        $state.go("home");
    }
    vm.checkFT = function(){
        console.dir(vm.getUser);
        var myReturn = $resource(apiBase + '/ftLogin');
        var data = myReturn.get({id:vm.getUser.Username,pw:vm.getUser.Password},function () {
            //console.dir(myNoticeRecord);
            console.dir(data);
            if(data.result=="fail")
            {
                vm.errorMsg ="Username Or Password is Wrong!";
            }
            else {
                vm.successMsg ='Login Success';
                var id=vm.getUser.Username;
                var date = new Date();
                date.setTime(date.getTime()+(24*60*60*1000));
                $cookies.put("foodtruckUser",id,{expires:date});
                $state.reload();
            }
           // vm.noticeResult = myNoticeRecord;
        });
    }
    console.dir("Login......");
});
