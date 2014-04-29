angular.module('emrApp').controller 'SurgeryCtrl', ['$scope', '$routeParams', '$sessionStorage', 'surgery', ($scope, $routeParams, $sessionStorage, surgery) ->
	$scope.surgery = surgery 
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.surgery.editor == $sessionStorage.user
]
				
