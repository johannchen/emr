angular.module('emrApp').controller 'PatientMedicationsCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.medications = Restangular.one('patients', $routeParams.patientId).all('medications').getList().$object
]
