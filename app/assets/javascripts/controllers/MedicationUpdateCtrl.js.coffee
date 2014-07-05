angular.module('emrApp').controller 'MedicationUpdateCtrl', ['$scope', '$location', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $location, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	id = $routeParams.id
	medicationBase = Restangular.one('patients', $routeParams.patientId).one('medications', id)
	medicationBase.get().then (medication) ->
		$scope.medication = medication
	$scope.save = ->
		medicationBase.medication = $scope.medication
		medicationBase.put()
		$location.path('/' + $routeParams.patientId + '/medications/' + id)
]
