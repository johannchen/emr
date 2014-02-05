angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', 'patient', 'PatientService', ($scope, patient, PatientService) ->
	
	$scope.patient = patient
	$scope.age = PatientService.age($scope.patient.birthday) if $scope.patient.birthday != ""
	PatientService.broadcastSid($scope.patient.sid)
]
				
