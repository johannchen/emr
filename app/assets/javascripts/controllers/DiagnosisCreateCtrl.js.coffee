angular.module('emrApp').controller 'DiagnosisCreateCtrl', ['$scope', '$sessionStorage', '$location', 'PatientService', 'Restangular', ($scope, $sessionStorage, $location, PatientService, Restangular) ->
	$scope.patient = $sessionStorage.patient
	$scope.save = ->
]
