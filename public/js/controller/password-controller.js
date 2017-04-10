(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('PasswordController', PasswordController)
  PasswordController.$inject = ['$scope', '$http', '$auth', '$location', '$resource'];
  function PasswordController($scope, $http,$auth, $location, $resource){
    console.log(111)
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
      console.log("login-success")
      $location.path('/sample');
    });


	}
});