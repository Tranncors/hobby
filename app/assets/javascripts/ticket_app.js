var Ticket_App = angular.module('Ticket_App',
   ['ngRoute',
     'ticketControllers',
     'ngSanitize',
     'ticketServices', 
     'ticketFilters',
     'ticketDirectives',
     'templates'  ]);
     
     Ticket_App.config(function($routeProvider){
         $routeProvider
         .when('/', {
             templateUrl: 'index.html',
             //controller: 'flightTicketController'
             controller: 'searchCtlr'
         });
     });
     
     Ticket_App.controller("flightTicketController", ["$scope","$resource",
     function($scope,$resource){
         $scope.trips = [];
         //var flightInfo = $resource('/api/v1/items.json');
         //$scope.trips = flightInfo.query(); 
         //var flightInfo = $resource('/search_flights.json');
         //$scope.trips = flightInfo.get();
         console.log($scope.trips);
         //var data = flightInfo.get();
         //$scope.trips = data;

     }]);
     
     
     
     
     