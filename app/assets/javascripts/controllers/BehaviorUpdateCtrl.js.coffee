angular.module('emrApp').controller 'BehaviorUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	id = $routeParams.id
	behaviorBase = Restangular.one('patients', $routeParams.patientId).one('behaviors', id)
	behaviorBase.get().then (behavior) ->
		$scope.behavior = behavior
	$scope.save = ->
		behaviorBase.behavior = $scope.behavior
		behaviorBase.put()
		$location.path('/' + $routeParams.patientId + '/behaviors/' + id)
]
