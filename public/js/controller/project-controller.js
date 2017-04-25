(function(){
  'use strict';
  angular.module('TaskTrackerApp').controller('ProjectController',ProjectController)
  ProjectController.$inject = ['$scope', '$http', '$location', '$resource'];
  function ProjectController($scope, $http, $location, $resource){
    $scope.project_types = []
    $scope.project_types.push("Fixed Bit","T&M");
    console.log($scope.project_types)
    $scope.saveProject = function (){
      var project_params ={'name':$scope.name,'start_date': $scope.start_date,'end_date':$scope.end_date,'project_type':$scope.project_type, 'hours':$scope.hours,'is_billable':$scope.is_billable}
      $http.post('/projects.json',project_params).then(function(response){
        $location.path("/sample")
      });
    }

  }
})();