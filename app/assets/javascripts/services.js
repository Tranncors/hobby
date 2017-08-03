'use strict';

var ticketServices = angular.module('ticketServices', ['ngResource']);

ticketServices.factory('Destination', ['$resource', '$rootScope',
  function($resource, $rootScope) {
    return $resource('cities/:city.json', {}, {
      query: {method: 'GET', params:{city: 'all'}, isArray:true}
    });
  }]);

ticketServices.factory('CityCode', ['$resource',
  function($resource) {
    return $resource('cities/city-codes.json', {}, {
      get: {method: 'GET'}
    });
  }]);

ticketServices.factory('CityAndAirportCode', ['$resource',
  function($resource) {
    return $resource('cities/city-airport-codes.json', {}, {
      get: {method: 'GET'}
    });
  }]);

ticketServices.factory('test', [
  function(){
    var testArr = [];
    function populateArr (){
      testArr = [];
      for(var i = 0; i < 11; i++){
        testArr.push(i);
      }
    }
    return {
      popArr: populateArr,
      getArr: function(){
        return testArr;
      }
    }
  }]);

ticketServices.factory('Flights', ['$resource',
  function($resource){
    return $resource('/search_flights.json');
  }]);
