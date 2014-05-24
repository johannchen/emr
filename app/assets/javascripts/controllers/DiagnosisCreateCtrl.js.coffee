angular.module('emrApp').controller 'DiagnosisCreateCtrl', ['$scope', '$routeParams', '$sessionStorage', '$location', 'Restangular', ($scope, $routeParams, $sessionStorage, $location, Restangular) ->
	$scope.patient = $sessionStorage.patient
	$scope.patientId = $routeParams.patientId
	$scope.diags = Restangular.all('diagnosis_names').getList().$object
	$scope.save = ->
		Restangular.one('patients', $scope.patientId).all("diagnoses").post($scope.diagnosis).then (diagnosis) ->
			$location.path('/' + $scope.patientId + '/diagnoses')
]
