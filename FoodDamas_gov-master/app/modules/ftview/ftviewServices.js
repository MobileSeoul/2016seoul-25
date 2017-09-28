/**
 * Created by Mr_Quang on 10/2/2016.
 */
/*
ftview.service('ftviewService',['$http', '$q','apiServices',function($http, $q,apiServices){
    var ftviewService ={};

    var getListNotice = function()
    {
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
    }
    ftviewService.getListNotice = getListNotice;
}]);*/
