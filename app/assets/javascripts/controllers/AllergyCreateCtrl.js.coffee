angular.module('emrApp').controller 'AllergyCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.meds = Restangular.all('med_names').getList().$object
	$scope.save = ->
		Restangular.one('patients', $scope.patientId).all("allergies").post($scope.allergy).then (allergy) ->
			$location.path('/' + $scope.patientId + '/allergies')
]
