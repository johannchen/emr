angular.module('emrApp').controller 'FamilyCtrl', ['$scope', '$routeParams', 'family', ($scope, $routeParams, family) ->
	$scope.family = family 
	$scope.patientId = $routeParams.patientId
]
				
