angular.module('emrApp').controller 'DiagnosisUpdateCtrl', ['$scope', '$location', '$sessionStorage', '$routeParams', 'Restangular', ($scope, $location, $sessionStorage, $routeParams, Restangular) ->
	$scope.patient = $sessionStorage.patient
	patientId = $routeParams.patientId
	id = $routeParams.id
	diagnosisBase = Restangular.one('patients', patientId).one('diagnoses', id)
	diagnosisBase.get().then (diagnosis) ->
		$scope.diagnosis = diagnosis
	$scope.save = ->
		$scope.diagnosis.edited_by = $sessionStorage.user
		diagnosisBase.diagnosis = $scope.diagnosis
		diagnosisBase.put()
		$location.path('/' + patientId + '/diagnoses/' + id)
]
