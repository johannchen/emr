angular.module('emrApp').controller 'PatientBehaviorsCtrl', ['$scope', '$routeParams','$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.behaviors = Restangular.one('patients', $routeParams.patientId).all('behaviors').getList().$object
]
