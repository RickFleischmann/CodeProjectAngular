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

        $scope.sortType = 'ARRANGERS1'; // set the default sort type
       $scope.sortReverse = false;  // set the default sort order
       $scope.searchOrch = '';     // set the default search/filter term


       $scope.ChangedTitleSearch = function () {
           if ($scope.titleContains.length < 3) return;
           $scope.GetTitleBySubstring();
       }

       $scope.GetTitleBySubstring = function () {
           $http({
               method: 'GET',
               url: 'http://99.248.19.5/webAPI/api/orchestrations?titleContains=' + $scope.titleContains,
               } 
           )
           .success(function (data) {
               $scope.orchestrations = data;
               //onsole.log($scope.orchestrations);
           })
           .error(function (data, status) {
               //onsole.log(data);
               window.alert('error');
           });



       }


   });