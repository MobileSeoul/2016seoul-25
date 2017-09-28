/**
 * Created by Mr_Quang on 9/23/2016.
 */

var app = angular.module('app',['angular-toArrayFilter','ui.router', 'ui.bootstrap', 'flash','angular-md5','ngCookies',
    //Inject Module
    'login','dashboard','ftview'
]);


app.config(['$stateProvider', '$locationProvider', '$urlRouterProvider', function ($stateProvider, $locationProvider, $urlRouterProvider, $modalInstance) {

    //IdleScreenList
    $stateProvider
        .state('app', {
            url: '/admin',
            templateUrl: 'app/common/app.html',
            controller: 'appCtrl',
            controllerAs: 'vm',

            authenticate: true,
            adminsite :true
        });

    $urlRouterProvider.otherwise('/page');

}]);
app.run(['$rootScope', '$location','$cookies','$state',function($rootScope, $location,$cookies,$state) {
    $rootScope.$on("$stateChangeStart", function(event,toState, toParams, fromState, fromParams){
        if(toState.adminsite)
        {
           /* console.log(toState.adminsite);*/
            if(toState.authenticate && !$cookies.get("user"))
            {
                // User isn’t authenticated
                $state.transitionTo("login");
                event.preventDefault();
            }
            if(!toState.authenticate  && $cookies.get("user")){

                $state.transitionTo("app.dashboard");
                event.preventDefault();
            }
        }
        if(toState.url =="/admin")
        {
            $state.transitionTo("app.dashboard");
            event.preventDefault();
        }




    });
}]);

app.constant('appSettings', appConfig);