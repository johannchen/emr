angular.module('emrApp').controller 'SurgeryCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	patientId = $routeParams.patientId
	$scope.save = ->
		Restangular.one('patients', patientId).all("surgeries").post($scope.surgery).then (surgery) ->
			$location.path('/' + patientId + '/surgeries')
]
