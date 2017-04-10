(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('LogoutController',LogoutController)
  LogoutController.$inject = ['$scope', '$http', '$auth', '$location', '$resource'];
  function LogoutController($scope, $http,$auth, $location, $resource){
    console.log(111)
      $scope.handleSignOutBtnClick = function() {
        $auth.signOut()
      };

      $scope.$on('auth:logout-error', function(ev, reason) {
        $scope.error = reason.errors[0];
        console.log(reason)
        console.log(ev)
        console.log("hi")
      });

      $scope.$on('auth:logout-success', function(ev, user) {
        // $scope.user = user;
        console.log("logout-success")
        $location.path('/login');
      });
      
  }

})();