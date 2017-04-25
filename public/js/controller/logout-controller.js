(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('LogoutController',LogoutController)
  LogoutController.$inject = ['$scope', '$http', '$auth', '$location', '$resource'];
  function LogoutController($scope, $http,$auth, $location, $resource){
      $scope.handleSignOutBtnClick = function() {
        $auth.signOut()
      };
    $scope.newProject = function(){
      $location.path('/newproject')
    }

      $scope.$on('auth:logout-error', function(ev, reason) {
        $scope.error = reason.errors[0];
      });

      $scope.$on('auth:logout-success', function(ev, user) {
        $scope.user = user;
        $location.path('/login');
      });
      
  }

})();