angular.module('emrApp').controller 'VisitCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	patientId = $routeParams.patientId
	$scope.save = ->
		Restangular.one('patients', patientId).all("visits").post($scope.visit).then (visit) ->
			$location.path('/' + patientId + '/visits/' + visit._id.$oid)
			window.scrollTo(0, 0)
]
