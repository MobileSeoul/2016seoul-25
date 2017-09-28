/**
 * Created by Mr_Quang on 9/30/2016.
 */
var view = angular.module("view",['ui.router', 'ngResource', 'ngAnimate','angular-md5','ngCookies']);

view.config(["$stateProvider", function ($stateProvider) {

    $stateProvider.state('home.homepage', {
        url: '/home',
        templateUrl: 'app/modules/ftview/views/homePage.html',
        controller: 'homepageViewCtrl',
        controllerAs: 'vm',
        authenticate: false,
        adminsite :false
    });
    $stateProvider.state('home.login', {
        url: '/login',
        templateUrl: 'app/modules/ftview/views/loginPage.html',
        controller: 'ftLoginCtrl',
        controllerAs: 'vm',
        authenticate: false,
        adminsite :false
    });
    $stateProvider.state('home.qna', {
        url: '/QnAView',
        templateUrl: 'app/modules/ftview/views/qnaView.html',
        controller: 'qnaViewCtrl',
        controllerAs: 'vm',
        authenticate: false,
        adminsite :false
    });
    $stateProvider.state('home.notice', {
        url: '/NoticeView',
        templateUrl: 'app/modules/ftview/views/noticeView.html',
        controller: 'noticeViewCtrl',
        controllerAs: 'vm',
        authenticate: false,
        adminsite :false
    });
}]);