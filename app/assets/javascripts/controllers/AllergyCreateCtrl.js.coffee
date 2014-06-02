angular.module('emrApp').controller 'AllergyCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', 'UtilService', ($scope, $routeParams, $location, Restangular, UtilService) ->
	$scope.patientId = $routeParams.patientId
	$scope.meds = Restangular.all('med_names').getList().$object
	$scope.save = ->
		index = UtilService.findIndexByKeyValue($scope.meds, "name", $scope.allergy.name)
		if index == -1
			Restangular.all("med_names").post({name: $scope.allergy.name}).then (med) ->
		Restangular.one('patients', $scope.patientId).all("allergies").post($scope.allergy).then (allergy) ->
			$location.path('/' + $scope.patientId + '/allergies')
]
