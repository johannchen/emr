angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', 'patient', 'PatientService', 'UtilService', ($scope, patient, PatientService, UtilService) ->
	$scope.patient = patient
	$scope.patient.medications = []	
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
				#TODO: use angular $index
				index = UtilService.findIndexByKeyValue($scope.patient.allergies, "name", "")
				$scope.patient.allergies.splice(index, 1)
				allergy.remove()
			else
				allergy.name = data
				allergy.put()
		true
	$scope.newMed = ->
		$scope.inserted = 
			name: ''
			script: ''
			comment: ''
		$scope.patient.medications.push($scope.inserted)
	$scope.newReaction = ->
		$scope.insertedReaction =
			id: ''
			medication: ''
			name: ''
		$scope.patient.reactions.push($scope.insertedReaction)
	$scope.removeReaction = (index) ->
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

			


]
				
