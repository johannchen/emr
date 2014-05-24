angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', '$sessionStorage', 'patient', 'Restangular', 'PatientService', 'UtilService', ($scope, $sessionStorage, patient, Restangular, PatientService, UtilService) ->
	$scope.patient = patient
	$sessionStorage.patient = $scope.patient.full_name

	$scope.meds = Restangular.all('med_names').getList().$object
	$scope.diags = Restangular.all('diagnosis_names').getList().$object

	PatientService.broadcastId($scope.patient.id.$oid)
	$scope.quickAddMedication = ->
		patient.all("medications").post($scope.medication).then (medication) ->
			$scope.patient.medications.push
				name: medication.name
				script: medication.script
			$scope.medication.name = ""
			$scope.medication.script = ""
		Restangular.all("med_names").post({name: $scope.medication.name}).then (med) ->
			$scope.meds.push
				id: med._id
				name: med.name
	$scope.quickAddFamily = ->
		patient.all("family_members").post($scope.family).then (family) ->
			$scope.patient.family_members.push
				id: family._id
				relation: family.relation
				description: family.description
			$scope.family.relation = ""
			$scope.family.description = ""
	$scope.quickAddAllergy = ->
		patient.all("allergies").post($scope.allergy).then (allergy) ->
			$scope.patient.allergies.push
				id: allergy._id
				name: allergy.name
				reaction: allergy.reaction
			$scope.allergy.name = ""
			$scope.allergy.reaction = ""
		Restangular.all("med_names").post({name: $scope.allergy.name}).then (med) ->
			$scope.meds.push
				id: med._id
				name: med.name
	$scope.quickAddSurgery = ->
		patient.all("surgeries").post($scope.surgery).then (surgery) ->
			$scope.patient.surgeries.push
				id: surgery._id
				name: surgery.name
				year: surgery.year
			$scope.surgery.name = ""
			$scope.surgery.year = ""
	$scope.quickAddDiagnosis = ->
		patient.all("diagnoses").post($scope.diagnosis).then (diagnosis) ->
			$scope.patient.diagnoses.push
				id: diagnosis._id
				name: diagnosis.name
				year: diagnosis.year
			$scope.diagnosis.name = ""
			$scope.diagnosis.year = ""
		Restangular.all("diagnosis_names").post({name: $scope.diagnosis.name}).then (diag) ->
			$scope.diags.push
				id: diag._id
				name: diag.name
	$scope.quickAddBehavior = ->
		patient.all("behaviors").post($scope.behavior).then (behavior) ->
			$scope.patient.behaviors.push
				id: behavior._id
				name: behavior.name
				details: behavior.details
			$scope.behavior.name = ""
			$scope.behavior.details = ""
	###					
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
				#TODO: use angular $index
				index = UtilService.findIndexByKeyValue($scope.patient.allergies, "name", "")
				$scope.patient.allergies.splice(index, 1)
				allergy.remove()
			else
				allergy.name = data
				allergy.put()
		true
	$scope.newReaction = ->
		$scope.insertedReaction =
			id: ''
			medication: ''
			name: ''
		$scope.patient.reactions.push($scope.insertedReaction)
	$scope.removeReaction = (index) ->
    if confirm("Are you sure to delete this reaction?")
      patient.one("reactions", @reaction.id.$oid).get().then (reaction) ->
        reaction.remove()
        $scope.patient.reactions.splice(index, 1)
	$scope.saveReaction = ->
		myReaction = @reaction
		if @reaction.id == ''
			# create 
			patient.all("reactions").post(@reaction).then (reaction) ->
				myReaction.id = reaction._id
		else
			# update 
			patient.one("reactions", @reaction.id.$oid).get().then (reaction) ->
				reaction.medication = myReaction.medication
				reaction.name = myReaction.name
				reaction.put()
		@reactionForm.$cancel() 
###
]
				
