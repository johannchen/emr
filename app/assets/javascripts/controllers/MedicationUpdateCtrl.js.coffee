angular.module('emrApp').controller 'MedicationUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	patientId = $routeParams.patientId
	id = $routeParams.id
	medicationBase = Restangular.one('patients', patientId).one('medications', id)
	medicationBase.get().then (medication) ->
		$scope.medication = medication
	$scope.save = ->
		medicationBase.medication = $scope.medication
		medicationBase.put()
		$location.path('/' + patientId + '/medications/' + id)
]
