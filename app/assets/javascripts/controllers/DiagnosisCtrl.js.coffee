angular.module('emrApp').controller 'DiagnosisCtrl', ['$scope', '$route', '$sessionStorage', 'PatientService', 'UtilService', 'Restangular', ($scope, $route, $sessionStorage, PatientService, UtilService, Restangular) ->
	$scope.patient = $sessionStorage.patient
	id = $route.current.params.id
	$scope.diagnosis = Restangular.one('patients', $scope.patient.sid).one('diagnoses', id).get().$object
]
