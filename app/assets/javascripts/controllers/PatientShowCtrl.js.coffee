angular.module('emrApp').controller 'PatientShowCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	patientId = $routeParams.patientId
	Restangular.one('patients', patientId).get().then (patient) ->
		$scope.patient = patient

]
				
