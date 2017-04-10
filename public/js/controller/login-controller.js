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

    $scope.forgotPassword = function(){
      $location.path('/forgotpassword')
    }
    $scope.handlePwdResetBtnClick = function() {
      $auth.requestPasswordReset($scope.pwdResetForm)
    };
    $scope.$on('auth:password-reset-request-error', function(ev, reason) {
      $scope.error = reason.errors[0];
      console.log(reason)
      console.log(ev)
    });

    $scope.$on('auth:password-reset-request-success', function(ev, user) {
      $scope.user = user;
      console.log("forgotpassword-success")
      $location.path('/sample');
    });
  }

})();