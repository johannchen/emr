angular.module('emrApp').controller 'FamilyUpdateCtrl', ['$scope', '$location', '$routeParams', '$sessionStorage', 'Restangular', ($scope, $location, $routeParams, $sessionStorage, Restangular) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	id = $routeParams.id
	Restangular.all('patients').getList().then (patients) ->
		$scope.patients = patients
	familyBase = Restangular.one('patients', $scope.patientId).one('family_members', id)
	familyBase.get().then (family) ->
		$scope.family = family
	$scope.save = ->
		familyBase.family_member = $scope.family
		familyBase.put()
		$location.path('/' + $scope.patientId + '/family/' + id)
]
