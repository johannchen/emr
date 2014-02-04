angular.module('emrApp').controller 'PatientMenuCtrl', ['$scope', '$location', 'Restangular', ($scope, $location, Restangular) ->
	$scope.init = ->
		Restangular.all('patients').getList().then (patients) ->
			$scope.patients = patients
	$scope.selectPatient = ->
		$location.path('/' + $scope.currentPatientId) if $scope.currentPatientId != ""
]
				
