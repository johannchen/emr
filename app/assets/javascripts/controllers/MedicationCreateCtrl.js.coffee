angular.module('emrApp').controller 'MedicationCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', ($scope, $routeParams, $location, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.meds = Restangular.all('med_names').getList().$object
	$scope.save = ->
		Restangular.one('patients', $scope.patientId).all("medications").post($scope.medication).then (medication) ->
			$location.path('/' + $scope.patientId + '/medications')
]
