/**
 * Created by Mr_Quang on 9/23/2016.
 */

login.controller("loginCtrl",['$rootScope','$state','$location','md5','$cookies',function($rootScope,$state,$location,md5,$cookies){
    var vm =this;

    vm.checkLogin =false;

    vm.loginHeader = "Login";
    vm.getUser = {};

    //access login
    vm.login = function (data) {
        if(data.Username =="admin"){
            if(md5.createHash(data.Password) == md5.createHash("admin"))
            {
                delete vm.errorMsg;
                vm.successMsg = "Login Success";
                var date = new Date();
                date.setTime(date.getTime()+(24*60*60*1000));

                vm.loginSuccess();


                $cookies.put("user",data.Username,{expires:date});

            }
            else
            {
                vm.errorMsg ="Invalid Password, Try Again!";
            }
        }else {
            vm.errorMsg = "Invalid Username, Try Again!";
        }

    };
    vm.change =function(){
        $state.go('app.dashboard');
    }
    vm.processBar = function(){
        var value= 0;
        interval = setInterval(function() {
            value += 10;
            $("#progress-bar")
                .css("width", value + "%")
                .attr("aria-valuenow", value)
                .text(value + "%");
            if (value >= 100)
                clearInterval(interval);
        }, 900);
    }
    vm.loginSuccess = function(){
        vm.checkLogin =true;
        vm.showCountDown("#countdown");
        vm.processBar();
        timeout =setTimeout(vm.change,10000);
    }
    vm.showCountDown = function(id){
        $(id).countdowntimer({
            seconds : 10
        });
    }
    console.log("Call Login Ctrl");
}]);


