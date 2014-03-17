angular.module('emrApp').controller 'PatientDiagnosisCtrl', ['$scope', '$sessionStorage', 'PatientService', 'UtilService', ($scope, $sessionStorage, PatientService, UtilService) ->
	$scope.patient = $sessionStorage.patient
	PatientService.broadcastSid($scope.patient.sid)
]
