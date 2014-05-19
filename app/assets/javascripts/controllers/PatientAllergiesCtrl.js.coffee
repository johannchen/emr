angular.module('emrApp').controller 'PatientAllergiesCtrl', ['$scope', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.allergies = Restangular.one('patients', $routeParams.patientId).all('allergies').getList().$object
]
