angular.module('emrApp').controller 'BehaviorCtrl', ['$scope', '$routeParams', '$sessionStorage', 'behavior', ($scope, $routeParams, $sessionStorage, behavior) ->
	$scope.behavior = behavior 
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.behavior.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
				
