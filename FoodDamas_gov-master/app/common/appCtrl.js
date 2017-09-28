/**
 * Created by Mr_Quang on 9/23/2016.
 */


app.controller("appCtrl", ['$rootScope', '$scope', '$state', '$location', 'Flash','appSettings','$cookies',
function ($rootScope, $scope, $state, $location, Flash,appSettings,$cookies){
    var vm =this;


    vm.menuItems =[
        {
            title:'Home',
            icon:'dashboard',
            state:'dashboard'
        },
        {
            title:'Food Truck',
            icon:'truck',
            state:'foodtruck'
        },
        {
            title:'Sale Total View',
            icon:'money',
            state:'totalview'
        },
        {
            title:"QnA",
            icon:"question-circle",
            state:"qna"
        },
        {
            title:"Notice",
            icon:"newspaper-o",
            state:"notice"
        }
    ];
    vm.signOut = function(){

        $cookies.remove("user");
        $state.go("login");
    }
    //controll sidebar open & close in mobile and normal view
    vm.sideBar = function (value) {
        if($(window).width()<=767){
            if ($("body").hasClass('sidebar-open'))
                $("body").removeClass('sidebar-open');
            else
                $("body").addClass('sidebar-open');
        }
        else {
            if(value==1){
                if ($("body").hasClass('sidebar-collapse'))
                    $("body").removeClass('sidebar-collapse');
                else
                    $("body").addClass('sidebar-collapse');
            }
        }
    };

    console.log('getting in to the app controller');

}]);