angular.module('emrApp').controller 'MedicationCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	medicationBase = Restangular.one('patients', $routeParams.patientId).one('medications', $routeParams.id)
	medicationBase.get().then (medication) ->
		$scope.medication = medication
		$scope.isEditor = $scope.medication.editor == $sessionStorage.user.name or $sessionStorage.user.admin
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.stop = ->
		$scope.medication.stop = true
		medicationBase.medication = $scope.medication
		medicationBase.put()
	$scope.start = ->
		$scope.medication.stop = false
		medicationBase.medication = $scope.medication
		medicationBase.put()
]
				
