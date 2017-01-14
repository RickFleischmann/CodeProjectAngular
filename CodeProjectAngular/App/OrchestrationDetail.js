

(function() {

    var appVar = angular.module("app");
 
    appVar.controller("OrchestrationDetailController", ["$scope", "$http", function ($scope, $http) {

    console.log($scope.Route.ID)

    }]);

}());