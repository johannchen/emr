angular.module('emrApp').controller 'MedicationCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	patientId = $routeParams.patientId
	$scope.save = ->
		Restangular.one('patients', patientId).all("medications").post($scope.medication).then (medication) ->
			$location.path('/' + patientId + '/medications')
]
