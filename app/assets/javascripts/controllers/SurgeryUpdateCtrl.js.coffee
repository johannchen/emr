angular.module('emrApp').controller 'SurgeryUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	$scope.patientId = $routeParams.patientId
	id = $routeParams.id
	surgeryBase = Restangular.one('patients', $routeParams.patientId).one('surgeries', id)
	surgeryBase.get().then (surgery) ->
		$scope.surgery = surgery
	$scope.save = ->
		surgeryBase.surgery = $scope.surgery
		surgeryBase.put()
		$location.path('/' + $routeParams.patientId + '/surgeries/' + id)
]
