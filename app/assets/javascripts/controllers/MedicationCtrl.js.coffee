angular.module('emrApp').controller 'MedicationCtrl', ['$scope', '$routeParams', '$sessionStorage', 'medication', ($scope, $routeParams, $sessionStorage, medication) ->
	$scope.medication = medication 
	$scope.patientId = $routeParams.patientId
	$scope.isEditor = $scope.medication.editor == $sessionStorage.user
]
				
