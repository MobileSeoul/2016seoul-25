/**
 * Created by Mr_Quang on 9/28/2016.
 */
dashboard.service('dashboardService',['$http', '$q','apiServices',function($http, $q,apiServices){
    var dashboardService ={};
    /*List FT*/
    {
        var getListFTFull = function()
        {
            var deferred = $q.defer();
            apiServices.getNoParam("getFTInfoFull").then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var updateFTState = function(param){
            var deferred = $q.defer();
            apiServices.update("updateState", param).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };

        var getHistorySale = function(param){
            var deferred = $q.defer();
            apiServices.getWithParam("historysale",param).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
        var getTotalListByDate = function(param){
            var deferred = $q.defer();
            apiServices.getWithParam("getListTotalByDate",param).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
    }
    {
        dashboardService.getListFTFull = getListFTFull;
        dashboardService.getTotalListByDate = getTotalListByDate;
        dashboardService.getHistorySale = getHistorySale;
        dashboardService.updateFTState= updateFTState;
    }
    /*End List FT*/
    /*QnA Service*/
    {
        var getListQuestion = function () {
            var deferred = $q.defer();
            apiServices.getNoParam("listQuestion2").then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var updateAnswer = function (parameters) {
            var deferred = $q.defer();
            apiServices.update("editAnswer", parameters).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var createAnswer = function (parameters) {
            var deferred = $q.defer();
            apiServices.create("addNewAnswer", parameters).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var deleteAnswer = function (parameter) {
            var deferred = $q.defer();
            apiServices.delete("deleteAnswer", parameter).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
    }
    /*End QnAService*/
    /*Notice Service*/
    /*End Notice Service*/
    {
        var getList = function(){
            var deferred = $q.defer();
            apiServices.getNoParam("listnotice").then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var createNotice = function(parameters){
            var deferred = $q.defer();
            apiServices.create("createNotice", parameters).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };
        var updateNotice = function(param){
            var deferred = $q.defer();
            apiServices.update("updateNotice", param).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
        var deleteNotice = function(param){
            var deferred = $q.defer();
            apiServices.delete("deleteNotice", param).then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
    }
    /*QnAService*/
    {
        dashboardService.getListQuesttion = getListQuestion;
        dashboardService.editAnswer = updateAnswer;
        dashboardService.createAnswer = createAnswer;
        dashboardService.deleteAnswer = deleteAnswer;
    }
    /*End QnAService*/
    /*Notice Service*/
    {
        dashboardService.getlistNotice = getList;
        dashboardService.createNotice = createNotice;
        dashboardService.updateNotce = updateNotice;
        dashboardService.deleteNotice = deleteNotice;
    }
    /*End Notice Service*/
    /*DashBoard Service*/
    {
        var getListTotal = function () {
            var deferred = $q.defer();
            apiServices.getNoParam("listTotal").then(function (response) {
                    if (response)
                    {
                        deferred.resolve(response);
                    }
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        };

        var getTotalMemberByMonth = function(){
            var deferred = $q.defer();
            apiServices.getNoParam("memberTotalByMonth").then(function (response) {
                    if (response)
                        deferred.resolve(response);
                    else
                        deferred.reject("Something went wrong while processing your request. Please Contact Administrator.");
                },
                function (response) {
                    deferred.reject(response);
                });
            return deferred.promise;
        }
    }
    /*End of DashBoard Service*/
    /* DashBoard Service */
    {
        dashboardService.getListTotal = getListTotal;
        dashboardService.getTotalMemberByMonth = getTotalMemberByMonth;
    }

    /* End DashBoard Service */

    return dashboardService;
}]);