angular.module('emrApp').controller 'BehaviorCreateCtrl', ['$scope', '$routeParams', '$location', '$sessionStorage', 'Restangular', ($scope, $routeParams, $location, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.save = ->
		Restangular.one('patients', $scope.patientId).all("behaviors").post($scope.behavior).then (behavior) ->
			$location.path('/' + $scope.patientId + '/behaviors')
]
