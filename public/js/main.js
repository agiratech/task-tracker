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
        templateUrl: 'templates/dashboard/main.html'
       })
       .when('/home',{
        controller: 'LogoutController',
        templateUrl: 'templates/dashboard/default_dashboard.html'
       })
       .when('/forgotpassword',{
        controller: 'LoginController',
        templateUrl: 'templates/login/forgetpassword.html'
       })
       .when('/newproject',{
        controller: 'ProjectController',
        templateUrl: 'templates/projects/new_project.html'
       })
       .otherwise({ redirectTo: '/' });
      }

    run.$inject = ['$rootScope', '$location'];
    function run($rootScope, $location) {
    $rootScope.location = $location
    }

})();