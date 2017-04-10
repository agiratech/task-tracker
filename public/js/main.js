(function () {
   'use strict';

   angular
    .module('TaskTrackerApp', ['ngRoute','ngResource', 'ng-token-auth'])
    .config(config)
    .run(run);

    config.$inject = ['$routeProvider', '$locationProvider'];
     function config($routeProvider, $locationProvider) {
       $routeProvider
       .when('/login',{
        controller: 'LoginController',
        templateUrl:'templates/login/form.html'
       })
       .when('/sample',{
        controller: 'LogoutController',
        templateUrl: 'templates/login/sample.html'
       })
       .otherwise({ redirectTo: '/login' });
      }

    run.$inject = ['$rootScope', '$location'];
    function run($rootScope, $location) {
    console.log("test")
      $location.path('/login')
    }


})();