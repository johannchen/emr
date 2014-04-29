angular.module('emrApp').controller 'PatientSurgeriesCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.surgeries = Restangular.one('patients', $routeParams.patientId).all('surgeries').getList().$object
]
