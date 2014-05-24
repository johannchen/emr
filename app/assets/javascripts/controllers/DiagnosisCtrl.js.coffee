angular.module('emrApp').controller 'DiagnosisCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patient = $sessionStorage.patient
	$scope.patientId = $routeParams.patientId
	$scope.diags = Restangular.all('diagnosis_names').getList().$object
	id = $routeParams.id
	diagnosisBase = Restangular.one('patients', $scope.patientId).one('diagnoses', id)
	$scope.diagnosis = diagnosisBase.get().$object
	$scope.isEditor = $scope.diagnosis.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
