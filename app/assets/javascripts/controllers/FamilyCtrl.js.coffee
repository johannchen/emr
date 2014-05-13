angular.module('emrApp').controller 'FamilyCtrl', ['$scope', '$routeParams', '$sessionStorage', 'family', ($scope, $routeParams, $sessionStorage, family) ->
	$scope.family = family 
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.family.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
				
