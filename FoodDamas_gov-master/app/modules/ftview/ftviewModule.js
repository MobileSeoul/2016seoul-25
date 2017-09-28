/**
 * Created by Mr_Quang on 9/25/2016.
 */
var ftview = angular.module("ftview", ['ui.router', 'ngResource', 'ngAnimate', 'angular-md5', 'ngCookies',
    'view'
]);

ftview.config(["$stateProvider", function ($stateProvider) {
    $stateProvider.state('home', {
        url: '/page',
        templateUrl: 'app/modules/ftview/ftview.html',
        controller: 'ftviewCtrl',
        controllerAs: 'vm',
        authenticate: false,
        adminsite: false
    });

}]);
ftview.run(['$rootScope', '$location', '$cookies', '$state', function ($rootScope, $location, $cookies, $state) {
    $rootScope.$on("$stateChangeStart", function (event, toState, toParams, fromState, fromParams) {
        if (toState.url == '/page') {
            $state.transitionTo("home.homepage");
            event.preventDefault();
        }
    });
}]);