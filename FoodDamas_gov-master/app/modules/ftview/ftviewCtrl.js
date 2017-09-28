/**
 * Created by Mr_Quang on 9/25/2016.
 */
ftview.controller("ftviewCtrl",function($scope,$cookies,$state){
    var vm = this;
    console.log("ftview ctrl ............");


    if(!$cookies.get("foodtruckUser"))
    {
        $state.go("home.homepage");
    }
    $scope.checkUserLogin =$cookies.get("foodtruckUser");
    vm.userLogout = function(){
        console.dir($cookies.get("foodtruckUser"));
        $cookies.remove("foodtruckUser");
        $state.reload();
    }

    vm.menu =[
        {
            title:'Home',
            state:'homepage'
        },
        {
            title:'QnA',
            state:'qna'
        },
        {
            title:'Notice',
            state:'notice'
        }
    ];
    vm.menuclick =function(){
        if($(window).width()<=767) {
            console.log("yes");
            $("#navbarMenu").click();
        }
    }
    vm.loginClick = function(){

        $state.go("home.login");


    }
});