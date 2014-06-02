angular.module('emrApp').controller 'DictionaryCtrl', ['$scope', 'Restangular', 'UtilService', ($scope, Restangular, UtilService) ->
	$scope.meds = Restangular.all('med_names').getList().$object 
	$scope.diagnoses = Restangular.all('diagnosis_names').getList().$object 
	$scope.surgeries = Restangular.all('surgery_names').getList().$object 

	$scope.addMed = ->
		if $scope.newMed != ""
			Restangular.all("med_names").post({name: $scope.newMed}).then (med) ->
				$scope.meds.push
					 id: med._id
					 name: med.name
				$scope.newMed = "" 
	$scope.updateMed = (data) ->
		Restangular.one("med_names", @med.id.$oid).get().then (med) ->
			if data == ""
				index = UtilService.findIndexByKeyValue($scope.meds, "name", "")
				$scope.meds.splice(index, 1)
				med.remove()
			else
				med.name = data
				med.put()
		true
	$scope.addDiagnosis = ->
		if $scope.newDiagnosis != ""
			Restangular.all("diagnosis_names").post({name: $scope.newDiagnosis}).then (diagnosis) ->
				$scope.diagnoses.push
					 id: diagnosis._id
					 name: diagnosis.name
				$scope.newDiagnosis = "" 
	$scope.updateDiagnosis = (data) ->
		Restangular.one("diagnosis_names", @diagnosis.id.$oid).get().then (diagnosis) ->
			if data == ""
				index = UtilService.findIndexByKeyValue($scope.diagnoses, "name", "")
				$scope.diagnoses.splice(index, 1)
				diagnosis.remove()
			else
				diagnosis.name = data
				diagnosis.put()
		true
				
	$scope.addSurgery = ->
		if $scope.newSurgery != ""
			Restangular.all("surgeries_names").post({name: $scope.newSurgery}).then (surgery) ->
				$scope.surgeries.push
					 id: surgery._id
					 name: surgery.name
				$scope.newSurgery = "" 
	$scope.updateSurgery = (data) ->
		Restangular.one("surgeries_names", @surgery.id.$oid).get().then (surgery) ->
			if data == ""
				index = UtilService.findIndexByKeyValue($scope.surgeries, "name", "")
				$scope.surgeries.splice(index, 1)
				surgery.remove()
			else
				surgery.name = data
				surgery.put()
		true

]
				
