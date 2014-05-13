angular.module('emrApp').controller 'DiagnosisCtrl', ['$scope', '$route', '$sessionStorage', 'Restangular', ($scope, $route, $sessionStorage, Restangular) ->
	$scope.patient = $sessionStorage.patient
	id = $route.current.params.id
	diagnosisBase = Restangular.one('patients', $scope.patient.sid).one('diagnoses', id)
	$scope.diagnosis = diagnosisBase.get().$object
	$scope.isEditor = $scope.diagnosis.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
