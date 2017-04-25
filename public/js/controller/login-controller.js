(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('LoginController',LoginController)
  LoginController.$inject = ['$scope', '$http', '$auth', '$location', '$resource'];
  function LoginController($scope, $http,$auth, $location, $resource){
      $scope.handleLoginBtnClick = function() {
        $auth.submitLogin($scope.loginForm)
    };
    $scope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });

    $scope.$on('auth:login-success', function(ev, user) {
      $scope.user = user;
      $location.path('/sample');
    });

     $scope.newProject = function(){
      $location.path('/newproject')
    }

    $scope.forgotPassword = function(){
      $location.path('/forgotpassword')
    }
    $scope.handlePwdResetBtnClick = function() {
      $auth.requestPasswordReset($scope.pwdResetForm)
    };
    $scope.$on('auth:password-reset-request-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });

    $scope.$on('auth:password-reset-request-success', function(ev, user) {
      $scope.user = user;
      $location.path('/sample');
    });
  }

})();