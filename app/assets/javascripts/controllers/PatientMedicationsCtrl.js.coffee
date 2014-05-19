angular.module('emrApp').controller 'PatientMedicationsCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.medications = Restangular.one('patients', $routeParams.patientId).all('medications').getList().$object
	$scope.isActive = (med) ->
		med.stop == false or med.stop == null
]
