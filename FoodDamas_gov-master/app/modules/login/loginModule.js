/**
 * Created by Mr_Quang on 9/23/2016.
 */
var login = angular.module("login", ['ui.router', 'ngResource', 'ngAnimate','angular-md5','ngCookies']);

login.config(["$stateProvider", function ($stateProvider) {

    //login page state
    $stateProvider.state('login', {
        url: '/admin/login',
        templateUrl: 'app/modules/login/index.html',
        controller: 'loginCtrl',
        controllerAs: 'vm',
        data: {
            pageTitle: 'Login'
        },
        authenticate: false,
        adminsite :true
    });
}]);