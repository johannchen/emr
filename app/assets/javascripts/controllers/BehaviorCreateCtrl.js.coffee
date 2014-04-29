angular.module('emrApp').controller 'BehaviorCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	patientId = $routeParams.patientId
	$scope.save = ->
		Restangular.one('patients', patientId).all("behaviors").post($scope.behavior).then (behavior) ->
			$location.path('/' + patientId + '/behaviors')
]
