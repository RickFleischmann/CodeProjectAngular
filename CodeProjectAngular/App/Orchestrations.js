

(function() {

    var appVar = angular.module("app");
 
    appVar.controller("OrchestrationsController", ["$scope", "$http", function ($scope, $http) {

        $scope.sortType = 'ARRANGERS1'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $scope.searchOrch = '';     // set the default search/filter term


        $scope.ChangedTitleSearch = function () {
            if ($scope.titleContains.length < 3) return;
            $scope.GetTitleBySubstring();
        }

        //$scope.GetTitleBySubstring = function () {
        //    $http({
        //        method: 'GET',
        //        url: 'http://99.248.19.5/webAPI/api/orchestrations?titleContains=' + $scope.titleContains,
        //    }
        //    )
        //    .success(function (data) {
        //        $scope.orchestrations = data;
        //        //onsole.log($scope.orchestrations);
        //    })
        //    .error(function (data, status) {
        //        //onsole.log(data);
        //        window.alert('error');
        //    });
        //}

        $scope.sortType = 'TITLE'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $scope.searchOrch = '';     // set the default search/filter term
        $scope.compLyrContains = '';
        $scope.titleContains = '';

        $scope.ChangedTitleSearch = function () {
            if ($scope.titleContains.length < 3) return;
            $scope.GetTitleBySubstring();
        }


        $scope.GetTitleBySubstring = function () {

            if ($scope.titleContains == '')
                { $scope.titleContainsParam = '{}' }
            else
                { $scope.titleContainsParam = $scope.titleContains }

            if ($scope.compLyrContains == '')
              { $scope.compLyrContainsParam = '{}' }
            else
                { $scope.compLyrContainsParam = $scope.compLyrContains }

  
            $http({
                method: 'GET',
                url: 'http://99.248.19.5/webAPI/api/orchestrations?titleContainsParam=' + $scope.titleContainsParam + '&compLyrContainsParam=' + $scope.compLyrContainsParam,
            })
            .success(function (data) {
                $scope.orchestrations = data;
             })
            .error(function (data, status) {
                 window.alert('error');
            });


            //var data = $.param({
            //    ID: 'bob',
            //    V1: 'pablo'
            //});

            //var config = {
            //    headers: {
            //        'Content-Type': 'application/json'
            //    }
            //}


            //$http.post(
            //    'http://99.248.19.5/webAPI/api/orchestrations',
            //    data,
            //    config
            //    ).then(
            //       function (response) {
            //           // success callback
            //           $scope.orchestrations = response.data;
            //       },
            //       function (response) {
            //           // failure callback
            //       }
            //    );



        }

        // ERRORS
        // final one, resulting from above, was 500 INTERNAL SERVER ERROR.
        // application/json - internal server error; OPTIONS preflight happens if you don't disable chrome extension access origin control
        // text/plain - unsupp. media type

  

        $scope.gomodal = function () {
            //onsole.log('went');
            $('#myModal').modal();
        }

    }]);

}());