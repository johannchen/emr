angular.module('emrApp').controller 'DiagnosisCreateCtrl', ['$scope', '$routeParams', '$sessionStorage', '$location', 'Restangular', 'UtilService', ($scope, $routeParams, $sessionStorage, $location, Restangular, UtilService) ->
	$scope.patient = $sessionStorage.patient
	$scope.patientId = $routeParams.patientId
	$scope.diags = Restangular.all('diagnosis_names').getList().$object
	$scope.save = ->
		index = UtilService.findIndexByKeyValue($scope.diags, "name", $scope.diagnosis.name)
		if index == -1
			Restangular.all("diagnosis_names").post({name: $scope.diagnosis.name}).then (diag) ->
		Restangular.one('patients', $scope.patientId).all("diagnoses").post($scope.diagnosis).then (diagnosis) ->
			$location.path('/' + $scope.patientId + '/diagnoses')
]
