angular.module('emrApp').controller 'PatientProfileCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	patientBase = Restangular.one('patients', $scope.patientId)
	patientBase.get().then (patient) ->
		$scope.patient = patient
		$scope.isEditor = $scope.patient.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
