angular.module('emrApp').controller 'MedicationCtrl', ['$scope', '$routeParams', 'medication', ($scope, $routeParams, medication) ->
	$scope.medication = medication 
	$scope.patientId = $routeParams.patientId
]
				
