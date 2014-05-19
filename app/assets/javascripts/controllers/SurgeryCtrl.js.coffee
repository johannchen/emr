angular.module('emrApp').controller 'SurgeryCtrl', ['$scope', '$routeParams', '$sessionStorage', 'surgery', ($scope, $routeParams, $sessionStorage, surgery) ->
	$scope.surgery = surgery 
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.isEditor = $scope.surgery.editor == $sessionStorage.user.name or $sessionStorage.user.admin

]
				
