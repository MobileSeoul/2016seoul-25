/**
 * Created by Mr_Quang on 9/28/2016.
 */
app.service('apiServices', ['$http', '$q', 'appSettings', function ($http, $q, appSettings) {

    var apiServices = {};
    var apiBase = appSettings.apiBase;

    var getNoParam = function (module) {
        var deferred = $q.defer();
        $http.get(apiBase + module, {headers: {'Content-Type': 'application/json'}})
            .success(function (response) {
                deferred.resolve(response);
            }).catch(function (data, status, headers, config) {
            deferred.reject(data.statusText);
        })
        return deferred.promise;
    };
    var getWithParam = function(module,parameter)
    {
        var deferred = $q.defer();
        $http.get(apiBase + module, { params: parameter }, { headers: { 'Content-Type': 'application/json' } })
            .success(function (response) {
            deferred.resolve(response);
        }).catch(function (data, status, headers, config) { // <--- catch instead error
            deferred.reject(data.statusText);
        });

        return deferred.promise;
    }
    var create = function (module, parameter) {
        var deferred = $q.defer();
        $http({
            method: 'POST',
            url: apiBase + module,
            params: parameter
        })
            .success(function (response) {
                deferred.resolve(response);
            }).catch(function (data, status, headers, config) {
            deferred.reject(data.statusText);
        });
        return deferred.promise;
    };
    var update = function (module, parameter) {
        var deferred = $q.defer();
        $http({
            method: 'POST',
            url: apiBase + module,
            params: parameter
        })
            .success(function (response) {
                deferred.resolve(response);
            }).catch(function (data, status, headers, config) {
            deferred.reject(data.statusText);
        });
        return deferred.promise;
    };

    var deleteService = function(module,parameter){
        var deferred = $q.defer();
        $http({
            method: 'POST',
            url: apiBase + module,
            params: parameter
        })
            .success(function (response) {
                deferred.resolve(response);
            }).catch(function (data, status, headers, config) {
            deferred.reject(data.statusText);
        });
        return deferred.promise;
    };

    apiServices.getNoParam = getNoParam;
    apiServices.getWithParam = getWithParam;
    apiServices.update = update;
    apiServices.create = create;
    apiServices.delete = deleteService;
    return apiServices;
}]);