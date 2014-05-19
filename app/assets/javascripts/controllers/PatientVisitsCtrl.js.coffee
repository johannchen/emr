angular.module('emrApp').controller 'PatientVisitsCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.visits = Restangular.one('patients', $routeParams.patientId).all('visits').getList().$object
]
