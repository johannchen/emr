angular.module('emrApp').controller 'PatientBehaviorsCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.behaviors = Restangular.one('patients', $routeParams.patientId).all('behaviors').getList().$object
]
