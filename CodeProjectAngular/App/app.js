'use strict';
// Code goes here
(function() {

// Declares how the application should be bootstrapped. See: http://docs.angularjs.org/guide/module
    var appVar = angular.module('app', ['ui.router']);

    appVar.config(['$stateProvider',
        function ($stateProvider) {
            // our routers, self explanatory
            $stateProvider
                .state('home', {
                    url: '/',
                    templateUrl: './View/Home.html',
                    controller: 'HomeController'
                })
                .state('movies', {
                    url: '/movies',
                    templateUrl: './View/Movies.html',
                    controller: 'MoviesController'
                })
               .state('orchestrations', {
                   url: '/orchestrations',
                   templateUrl: './View/Orchestrations.html',
                   controller: 'OrchestrationsController'
               })
                .state('otherwise', {
                    url: '*path',
                    templateUrl: '/View/Home.html',
                    controller: 'HomeController'
        });
    }]);

    appVar.directive("sort", function () {
        return {
            restrict: 'A',
            transclude: true,
            template:
              '<a class="table-header-sort" ng-click="onClick()">' +
                '<span ng-transclude></span>' +
                ' <i class="fa" ng-class="{\'fa-caret-down\' : order === by && !reverse,  \'fa-caret-up\' : order===by && reverse}"></i>' +
              '</a>',
            scope: {
                order: '=',
                by: '=',
                reverse: '='
            },
            link: function (scope, element, attrs) {
                scope.onClick = function () {
                    if (scope.order === scope.by) {
                        scope.reverse = !scope.reverse
                    } else {
                        scope.by = scope.order;
                        scope.reverse = false;
                    }
                }
            }
        }
    });

}());