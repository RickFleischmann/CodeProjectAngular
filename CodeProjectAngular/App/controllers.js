﻿angular.module('app.controllers', [])

    .controller('MoviesController', function ($scope, $http) {
        // this will do for now
        /* $scope.movies =
         [
             { Id: 1, Name: "Fight Club",Director: "David Fincher" },
             { Id: 2, Name: "Into The Wild", Director: "Sean Penn" },
             { Id: 3, Name: "Dancer in the Dark", Director:"Lars von Trier " }
         ];
         */


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
    }
  )
   .controller('RestaurantsController', function ($scope, $http) {
       $http({
           method: 'GET',
           url: 'http://99.248.19.5/webAPI/api/restaurants'
       })
      .success(function (data) {
          console.log(data);
          $scope.restaurants = data;
      })
      .error(function (data, status) {
          console.log(data);
          window.alert('error');
      });
   });