angular.module('emrApp').controller 'PatientDiagnosesCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patient = $sessionStorage.patient
	$scope.patientId = $routeParams.patientId
	$scope.diagnoses = Restangular.one('patients', $scope.patientId).all('diagnoses').getList().$object
]
