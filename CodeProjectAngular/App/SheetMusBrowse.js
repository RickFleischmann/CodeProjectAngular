

(function() {

    var appVar = angular.module("app");
 
    appVar.controller("SheetMusBrowseController", ["$scope", "$http", function ($scope, $http) {

        $scope.GetIndexFromObjectElement = function (obj, keyName, keyValue) {
            var newIndex = null;
            angular.forEach(obj, function (key, index) {
                if (key[keyName] === keyValue) newIndex = index;
            });
            return newIndex;
        };

        $scope.SORT_BY = 'TITLE'; // set the default sort type
        $scope.row_start = 1;
        $scope.row_display_end = 0;
        $scope.total_rows = 0;

        $scope.sortFields = ['TITLE', 'CATNUM', 'COMPOSERS1', 'KEY', 'TITLEYEAR', 'LYRICISTS1', 'PRODTYPE', 'PRODTITLE', 'LYRICISTS2', 'PUBLISHER', 'COMPOSERS2', 'COMPOSERS3', 'COMPOSERS4'];

        $scope.filterValues = {
            TITLE: '',
            CATNUM: '',
            COMP_LYR: '',
            PUBLISHER: '',
            PHOTO: '',
            TITLEYEAR: '',
            PRODTYPE: '',
            PRODTITLE: '',
            ARRANGTYPE: '',
            NOTES: '',
            PLATE_NUMBER: '',
            KEY: '',
            LARGE: '',
            ARRANGYEAR: '',
            PCN: '',
            PICTURE: ''
        };

        $scope.SORT_BY = 'TITLE'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order


        $scope.CheckQueryString = function () {
            console.log('query:');
            var queryString = '';
            angular.forEach($scope.filterValues, function (value, key) {
                queryString += $scope.filterValues[key];
            });

            console.log('query: ' + queryString);
            if (queryString.length > 0) {
                console.log("has filter");
                $scope.FilterIsSet = true;
            } else {
                console.log("has no filter");
                $scope.FilterIsSet = false;
            }

        }


        $scope.ClearFilter = function () {
            angular.forEach($scope.filterValues, function (value, key) {
                $scope.filterValues[key] = '';
            });

            $scope.SORT_BY = 'TITLE';

        };

        $scope.ClearFilter();

        $scope.PrepForAPI = function () {
            angular.forEach($scope.filterValues, function (value, key) {
                if ($scope.filterValues[key] === '') {
                    $scope.filterValues[key] = '{}';
                }
            });

        };

        $scope.PrepAfterAPI = function () {
            angular.forEach($scope.filterValues, function (value, key) {

                if ($scope.filterValues[key] === '{}') {
                    $scope.filterValues[key] = '';
                }
            });
        };

        $scope.Requery = function () {

            $scope.CheckQueryString();

            if ($scope.FilterIsSet == true) {
                $scope.row_start = 1;
                $scope.GetTitleBySubstring();
            }
            else {
                $scope.row_start = 0;
                $scope.GetTitleBySubstring();
            }

        };

        $scope.NextPage = function () {

            $scope.row_start += 20;
            $scope.GetTitleBySubstring();
        };

        $scope.PreviousPage = function () {

            $scope.row_start -= 20;
            $scope.GetTitleBySubstring();
        };

        $scope.isEmpty = function (obj) {
            for (var prop in obj) {
                if (obj.hasOwnProperty(prop))
                    return false;
            }
            return true;
        };

        $scope.ChangedTitleSearch = function () {
            // if searching from title box, clear all other query terms
            $scope.lastTitleFilter = $scope.filterValues.TITLE;
            $scope.ClearFilter();
            $scope.filterValues.TITLE = $scope.lastTitleFilter;

            //if ($scope.filterValues.TITLE.length < 3) return;
            $scope.GetTitleBySubstring();
        };

        $scope.GetTitleBySubstring = function () {

            $scope.CheckQueryString();

            if ($scope.FilterIsSet == false) {
                $scope.SheetMus = {};
                $scope.row_start = 0;
                $scope.row_display_end = 0;
                $scope.total_rows = 0;
                return;
            }

               // sets empty filter values to {}
            $scope.PrepForAPI();

            var uri = '?';

            // prepare uri for GET
            angular.forEach($scope.filterValues, function (value, key) {
                uri += key + '=' + value + '&';
             });

            // add ROW_START and SORT_TYPE
            uri += 'ROW_START=' + $scope.row_start + '&SORT_BY=' + $scope.SORT_BY;

            console.log(uri);


            $http({
                method: 'GET',
                url: 'http://99.248.19.5/webAPI/api/SheetMus' + uri
            })
            .success(function (data) {
                $scope.SheetMus = data;
                
                if ($scope.isEmpty($scope.SheetMus)) {
                    //onsole.log('empty');
                    $scope.row_start = 0;
                    $scope.row_display_end = 0;
                    $scope.total_rows = 0;
                    return;
                }

                 $scope.total_rows = $scope.SheetMus[0].TOTAL_ROWS;
 
                //onsole.log($scope.total_rows);
                //onsole.log($scope.SheetMus.length);

                if ($scope.row_start+19<$scope.total_rows) {
                    $scope.row_display_end = $scope.row_start + 19;
                }
                else if ($scope.row_start + 19>=$scope.total_rows) {
                    $scope.row_display_end = $scope.total_rows;
                }
                
                //onsole.log($scope.SheetMus);
            })
            .error(function (data, status) {
                window.alert('error');
            });

            // sets {} filter values to empty
            $scope.PrepAfterAPI();

        };
 
        $scope.FilterModal = function () {
            $('#FilterModal').modal();
        };

        $scope.DetailModal = function (id) {
            $scope.detailData = $scope.SheetMus[$scope.GetIndexFromObjectElement($scope.SheetMus, 'ID_SHEETMUS', id)];
            $('#DetailModal').modal();
        };

    }]);

}());