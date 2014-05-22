angular.module('emrApp').controller 'DictionaryCtrl', ['$scope', 'Restangular', 'UtilService', ($scope, Restangular, UtilService) ->
	$scope.meds = Restangular.all('med_names').getList().$object 
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
]
				
