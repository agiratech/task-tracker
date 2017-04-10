(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('LoginController',LoginController)
  LoginController.$inject = ['$scope', '$http', '$auth', '$location', '$resource'];
  function LoginController($scope, $http,$auth, $location, $resource){
    console.log(111)
      $scope.handleLoginBtnClick = function() {
        $auth.submitLogin($scope.loginForm)
    };
    $scope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
      console.log(reason)
      console.log(ev)
    });

    $scope.$on('auth:login-success', function(ev, user) {
      $scope.user = user;
      console.log("login-success")
      $location.path('/sample');
    });

    console.log($scope.loginForm)


  }

})();