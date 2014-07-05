angular.module('emrApp').controller 'VisitUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	id = $routeParams.id
	visitBase = Restangular.one('patients', $routeParams.patientId).one('visits', id)
	visitBase.get().then (visit) ->
		$scope.visit = visit
	$scope.save = ->
		visitBase.visit = $scope.visit
		visitBase.put()
		$location.path('/' + $routeParams.patientId + '/visits/' + id)
		window.scrollTo(0, 0)
]
