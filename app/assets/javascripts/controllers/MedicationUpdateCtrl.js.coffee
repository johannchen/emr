angular.module('emrApp').controller 'MedicationUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	id = $routeParams.id
	medicationBase = Restangular.one('patients', $routeParams.patientId).one('medications', id)
	medicationBase.get().then (medication) ->
		$scope.medication = medication
	$scope.save = ->
		medicationBase.medication = $scope.medication
		medicationBase.put()
		$location.path('/' + $routeParams.patientId + '/medications/' + id)
]
