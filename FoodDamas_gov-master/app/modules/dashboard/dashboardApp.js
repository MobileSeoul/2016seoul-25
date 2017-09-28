/**
 * Created by Mr_Quang on 9/23/2016.
 */
var dashboard = angular.module("dashboard", ['ui.bootstrap','ngMaterial','angularModalService','angular-toArrayFilter','angularUtils.directives.dirPagination','ui.router', 'ngResource', 'ngAnimate','angular-md5','ngCookies']);

dashboard.config(["$stateProvider","$mdDateLocaleProvider",function ($stateProvider,$mdDateLocaleProvider,$scope) {

    //dashboard page state
    $stateProvider.state('app.dashboard', {
        url: '/dashboard',
        templateUrl: 'app/modules/dashboard/views/DashboardHome.html',
        controller: 'homeCtrl',
        controllerAs: 'vm',
        authenticate: true,
        adminsite :true
    });
    $stateProvider.state('app.foodtruck', {
        url: '/foodtruck',
        templateUrl: 'app/modules/dashboard/views/FoodTruckView.html',
        controller: 'FoodTruckViewCtrl',
        controllerAs: 'vm',
        authenticate: true,
        adminsite :true
    });
    $stateProvider.state('app.totalview', {
        url: '/TotalView',
        templateUrl: 'app/modules/dashboard/views/TotalView.html',
        controller: 'TotalViewCtrl',
        controllerAs: 'vm',
        authenticate: true,
        adminsite :true
    });

    //QnA page state
    $stateProvider.state('app.qna', {
        url: '/QnA',
        templateUrl: 'app/modules/dashboard/views/QnAPage.html',
        controller: 'QnACtrl',
        controllerAs: 'vm',
        authenticate: true,
        adminsite :true
    });

    //Notice page state
    $stateProvider.state('app.notice', {
        url: '/Notice',
        templateUrl: 'app/modules/dashboard/views/NoticePage.html',
        controller: 'NoticeCtrl',
        controllerAs: 'vm',
        authenticate: true,
        adminsite :true
    });



}]);

