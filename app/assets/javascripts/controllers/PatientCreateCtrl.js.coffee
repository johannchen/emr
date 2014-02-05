angular.module('emrApp').controller 'PatientCreateCtrl', ['$scope', '$location', 'PatientService', 'Restangular', ($scope, $location, PatientService, Restangular) ->
	patients = Restangular.all('patients')
	$scope.save = ->
		patients.post($scope.patient).then (patient) ->
			console.log(patient)
			PatientService.reloadPatients()
			$location.path('/' + patient._id.$oid)
]