angular.module('emrApp').controller 'DiagnosisCtrl', ['$scope', '$route', '$sessionStorage', 'PatientService', 'UtilService', 'Restangular', ($scope, $route, $sessionStorage, PatientService, UtilService, Restangular) ->
	$scope.patient = $sessionStorage.patient
	id = $route.current.params.id
	diagnosisBase = Restangular.one('patients', $scope.patient.sid).one('diagnoses', id)
	$scope.diagnosis = diagnosisBase.get().$object
	$scope.markDelete = ->
		$scope.diagnosis.deleted = true
		$scope.diagnosis.edited_by = $sessionStorage.user
		diagnosisBase.diagnosis = $scope.diagnosis
		diagnosisBase.put()
	$scope.undoDelete = ->
		$scope.diagnosis.deleted = false
		$scope.diagnosis.edited_by = $sessionStorage.user
		diagnosisBase.diagnosis = $scope.diagnosis
		diagnosisBase.put()
]
