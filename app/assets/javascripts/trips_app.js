var tripapp = angular.module('trips',['ui.select', 'ngSanitize', 'rzModule', 'ngMaterial', 'ngAnimate', 'ngAria', 'ngMessages']);

tripapp.filter('propsFilter', function() {
  return function(items, props) {
    var out = [];

    if (angular.isArray(items)) {
      items.forEach(function(item) {
        var itemMatches = false;

        var keys = Object.keys(props);
        for (var i = 0; i < keys.length; i++) {
          var prop = keys[i];
          var text = props[prop].toLowerCase();
          if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
            itemMatches = true;
            break;
          }
        }

        if (itemMatches) {
          out.push(item);
        }
      });
    } else {
      // Let the output be the input untouched
      out = items;
    }

    return out;
  }
});

tripapp.controller("TripSearchController",[ "$scope","$http", 
  function($scope,$http) {
    $scope.origins = [];
    $scope.froms;
    $scope.tods;
    $scope.brsearch = function(searchFroms,searchTods,searchDeps,adultCount,childCount) {
      $scope.searchedFor = searchTods;
      $http.get("/request.json",{ "params": { "origin": searchFroms.iata, "destination": searchTods.iata, "date": searchDeps, 
      "adult_count": adultCount, "child_count": childCount } }
      ).then(function(response) {
        $scope.origins = response.data;
      },function(response) {
        alert("There was a problem: " + response.status);
      }
      );

    };
    
    $scope.address = {};
    $scope.refreshAddresses = function(address) {
    var params = {froms: address, sensor: false};
    return $http.get(
      '/google_flights.json',
      {params: params}
    ).then(function(response) {
      $scope.addresses = response.data;
    });
  };

   $scope.slider = {
    value: 1,
    options: {
        ceil: 10,
        floor: 1,
        showSelectionBar: true,
        showTicks: true,
        getTickColor: function (value) {
            if (value < 3)
              return 'red';
            if (value < 6)
              return 'orange';
            if (value < 9)
              return 'yellow';
            return '#2AE02A';
        }
    }
};

   $scope.slider1 = {
    value: 0,
    options: {
        ceil: 10,
        floor: 0,
        showSelectionBar: true,
        showTicks: true,
        getTickColor: function (value) {
            if (value < 3)
              return 'red';
            if (value < 6)
              return 'orange';
            if (value < 9)
              return 'yellow';
            return '#2AE02A';
        },
        stepsArray: [
      {value: 0, legend: 'No Child'},    
      {value: 1, legend: '1 Child'},
      {value: 2, legend: '2 Children'},
      {value: 3, legend: '3 Children'},
      {value: 4, legend: '4 Children'},
      {value: 5, legend: '5 Children'},
      {value: 6, legend: '6 Children'},
      {value: 7, legend: '7 Children'},
      {value: 8, legend: '8 Children'},
      {value: 9, legend: '9 Children'},
      {value: 10, legend: '10 Children'}
    ]
    }
};
    
   $scope.airline = {};
    $http.get('/airlines.json'
    ).then(function(response) {
      $scope.airlines = response.data;
    });
    
    $http.get('/airports.json'
    ).then(function(response) {
      $scope.airports = response.data;
    }); 
    
    $scope.people = [ "0","1","2","3","4","5","6","7","8","9","10"];
       
  }
]);