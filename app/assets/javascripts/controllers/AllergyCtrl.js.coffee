angular.module('emrApp').controller 'AllergyCtrl', ['$scope', '$routeParams', '$sessionStorage', 'allergy', ($scope, $routeParams, $sessionStorage, allergy) ->
	$scope.allergy = allergy 
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.allergy.editor == $sessionStorage.user.name or $sessionStorage.user.admin
]
				
