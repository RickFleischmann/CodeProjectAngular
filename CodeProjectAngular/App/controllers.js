angular.module('app.controllers', [])

    .controller('MoviesController', function ($scope, $http) {
 
        $http({
            method: 'GET',
            url: 'http://99.248.19.5//webAPI/api/movies'
        })
         .success(function (data) {
             console.log(data);
             $scope.movies = data;
         })
         .error(function (data, status) {
             console.log(data);
             window.alert('error');
         });
    })

    .controller('HomeController', function ($scope) {
    })

    .controller('ErrorCtrl', function ($scope) {
    })


   .controller('OrchestrationsController', function ($scope, $http) {
       $http({
           method: 'GET',
           url: 'http://99.248.19.5/webAPI/api/orchestrations'
       })
      .success(function (data) {
          
          $scope.orchestrations = data;

          console.log($scope.orchestrations);
      })
      .error(function (data, status) {
          console.log(data);
          window.alert('error');
      });
   });