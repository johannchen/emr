angular.module('emrApp').controller 'FamilyUpdateCtrl', ['$scope', '$location', '$routeParams', 'Restangular', ($scope, $location, $routeParams, Restangular) ->
	patientId = $routeParams.patientId
	id = $routeParams.id
	Restangular.all('patients').getList().then (patients) ->
		$scope.patients = patients
	familyBase = Restangular.one('patients', patientId).one('family_members', id)
	familyBase.get().then (family) ->
		$scope.family = family
	$scope.save = ->
		familyBase.family_member = $scope.family
		familyBase.put()
		$location.path('/' + patientId + '/family/' + id)
]
