angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', 'patient', 'PatientService', 'UtilService', ($scope, patient, PatientService, UtilService) ->
	$scope.patient = patient
	$scope.age = PatientService.age($scope.patient.birthday) if $scope.patient.birthday != ""
	PatientService.broadcastSid($scope.patient.sid)
	$scope.addAllergy = ->
		if $scope.newAllergy != ""
			patient.all("allergies").post({name: $scope.newAllergy}).then (allergy) ->
				$scope.patient.allergies.push
					 id: allergy._id
					 name: allergy.name
		$scope.isAddingAllergy = false
	$scope.updateAllergy = (data) ->
		patient.one("allergies", @allergy.id.$oid).get().then (allergy) ->
			if data == ""
				index = UtilService.findIndexByKeyValue($scope.patient.allergies, "name", "")
				$scope.patient.allergies.splice(index, 1)
				allergy.remove()
			else
				allergy.name = data
				allergy.put()
		true
]
				
