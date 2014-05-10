angular.module('emrApp').controller 'PatientUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	patientId = $routeParams.patientId
	patientBase = Restangular.one('patients', patientId)
	patientBase.get().then (patient) ->
		$scope.patient = patient
	$scope.save = ->
		patientBase.patient = $scope.patient
		patientBase.put()
		$location.path('/' + patientId + '/profile')
]
