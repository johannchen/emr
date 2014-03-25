angular.module('emrApp').controller 'PatientDiagnosesCtrl', ['$scope', '$sessionStorage', 'PatientService', 'UtilService', 'Restangular', ($scope, $sessionStorage, PatientService, UtilService, Restangular) ->
	$scope.patient = $sessionStorage.patient
	PatientService.broadcastSid($scope.patient.sid)
	$scope.diagnoses = Restangular.one('patients', $scope.patient.sid).all('diagnoses').getList().$object
]
