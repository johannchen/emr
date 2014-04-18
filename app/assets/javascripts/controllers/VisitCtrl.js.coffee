angular.module('emrApp').controller 'VisitCtrl', ['$scope', '$routeParams', 'visit', ($scope, $routeParams, visit) ->
	$scope.visit = visit
	$scope.patientId = $routeParams.patientId
]
				
