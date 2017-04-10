(function () {
   'use strict';

   angular
    .module('TaskTrackerApp', ['ngRoute','ngResource', 'ng-token-auth'])
<<<<<<< HEAD
    .config(config);
    // .run(run);
=======
    .config(config)
    .run(run);
>>>>>>> bc066787c10c1351e5b9204b9a637a7e8ffb30ac

    config.$inject = ['$routeProvider', '$locationProvider'];
     function config($routeProvider, $locationProvider) {
       $routeProvider
       .when('/login',{
        controller: 'LoginController',
        templateUrl:'templates/login/form.html'
       })
       .when('/sample',{
        controller: 'LogoutController',
<<<<<<< HEAD
        templateUrl: 'templates/dashboard/main.html'
       })
       .when('/forgotpassword',{
        controller: 'LoginController',
        templateUrl: 'templates/login/forgetpassword.html'
       })
       .otherwise({ redirectTo: '/' });
      }

    // run.$inject = ['$rootScope', '$location'];
    // function run($rootScope, $location) {
    // console.log("test")
    //   $location.path('/login')
    // }
=======
        templateUrl: 'templates/login/sample.html'
       })
       .otherwise({ redirectTo: '/login' });
      }

    run.$inject = ['$rootScope', '$location'];
    function run($rootScope, $location) {
    console.log("test")
      $location.path('/login')
    }
>>>>>>> bc066787c10c1351e5b9204b9a637a7e8ffb30ac


})();