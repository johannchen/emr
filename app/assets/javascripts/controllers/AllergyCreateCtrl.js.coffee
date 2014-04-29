angular.module('emrApp').controller 'AllergyCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	patientId = $routeParams.patientId
	$scope.save = ->
		Restangular.one('patients', patientId).all("allergies").post($scope.allergy).then (allergy) ->
			$location.path('/' + patientId + '/allergies')
]
