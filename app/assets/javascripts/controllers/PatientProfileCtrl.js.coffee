angular.module('emrApp').controller 'PatientProfileCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	patientId = $routeParams.patientId
	patientBase = Restangular.one('patients', patientId)
	patientBase.get().then (patient) ->
		$scope.patient = patient
]
