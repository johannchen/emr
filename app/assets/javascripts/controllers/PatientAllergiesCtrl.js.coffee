angular.module('emrApp').controller 'PatientAllergiesCtrl', ['$scope', '$routeParams', 'Restangular', ($scope, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.allergies = Restangular.one('patients', $routeParams.patientId).all('allergies').getList().$object
]
