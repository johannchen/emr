angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', 'patient', 'PatientService', ($scope, patient, PatientService) ->
	$scope.patient = patient
	$scope.age = PatientService.age($scope.patient.birthday) if $scope.patient.birthday != ""
	PatientService.broadcastSid($scope.patient.sid)
	$scope.updateAllergy = (data) ->
		$scope.patient.one("allergies", @allergy.id.$oid).get().then (allergy) ->
			allergy.name = data
			allergy.put()
		true
]
				
