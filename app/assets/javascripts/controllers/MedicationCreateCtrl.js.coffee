angular.module('emrApp').controller 'MedicationCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', 'UtilService', ($scope, $routeParams, $location, Restangular, UtilService) ->
	$scope.patientId = $routeParams.patientId
	$scope.meds = Restangular.all('med_names').getList().$object
	$scope.save = ->
		index = UtilService.findIndexByKeyValue($scope.meds, "name", $scope.medication.name)
		if index == -1
			Restangular.all("med_names").post({name: $scope.medication.name}).then (med) ->
		Restangular.one('patients', $scope.patientId).all("medications").post($scope.medication).then (medication) ->
			$location.path('/' + $scope.patientId + '/medications')
]
