angular.module('emrApp').controller 'PatientVisitsCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.visits = Restangular.one('patients', $routeParams.patientId).all('visits').getList().$object
]
