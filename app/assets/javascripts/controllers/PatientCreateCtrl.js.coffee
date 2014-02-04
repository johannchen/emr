angular.module('emrApp').controller 'PatientCreateCtrl', ['$scope', '$location', 'Restangular', ($scope, $location, Restangular) ->
	patients = Restangular.all('patients')
	$scope.save = ->
		patients.post($scope.patient)
		#$location.path('/' + patient.id.$oid)
		$location.path('/')
]
