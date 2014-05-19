angular.module('emrApp').controller 'PatientSurgeriesCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.surgeries = Restangular.one('patients', $routeParams.patientId).all('surgeries').getList().$object
]
