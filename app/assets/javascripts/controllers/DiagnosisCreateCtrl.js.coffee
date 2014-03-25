angular.module('emrApp').controller 'DiagnosisCreateCtrl', ['$scope', '$sessionStorage', '$location', 'PatientService', 'Restangular', ($scope, $sessionStorage, $location, PatientService, Restangular) ->
	$scope.patient = $sessionStorage.patient
	patientId = $scope.patient.sid
	$scope.save = ->
		$scope.diagnosis.edited_by = $sessionStorage.user
		Restangular.one('patients', patientId).all("diagnoses").post($scope.diagnosis).then (diagnosis) ->
			$location.path('/' + patientId + '/diagnoses')
]
