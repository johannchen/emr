angular.module('emrApp').controller 'DictionaryCtrl', ['$scope', 'Restangular', 'UtilService', ($scope, Restangular, UtilService) ->
	$scope.meds = Restangular.all('med_names').getList().$object 
	$scope.diagnoses = Restangular.all('diagnosis_names').getList().$object 

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
				#TODO: use angular $index
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
				#TODO: use angular $index
				index = UtilService.findIndexByKeyValue($scope.diagnoses, "name", "")
				$scope.diagnoses.splice(index, 1)
				diagnosis.remove()
			else
				diagnosis.name = data
				diagnosis.put()
		true
]
				
