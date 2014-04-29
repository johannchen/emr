angular.module('emrApp').controller 'AllergyUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	id = $routeParams.id
	allergyBase = Restangular.one('patients', $routeParams.patientId).one('allergies', id)
	allergyBase.get().then (allergy) ->
		$scope.allergy = allergy
	$scope.save = ->
		allergyBase.allergy = $scope.allergy
		allergyBase.put()
		$location.path('/' + $routeParams.patientId + '/allergies/' + id)
]
