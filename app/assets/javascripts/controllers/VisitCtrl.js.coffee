angular.module('emrApp').controller 'VisitCtrl', ['$scope', '$routeParams', '$sessionStorage', 'visit', ($scope, $routeParams, $sessionStorage, visit) ->
	$scope.visit = visit
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.visit.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
				
