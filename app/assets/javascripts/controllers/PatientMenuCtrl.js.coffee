angular.module('emrApp').controller 'PatientMenuCtrl', ['$scope', '$location', '$sessionStorage', 'PatientService', 'Restangular', ($scope, $location, $sessionStorage, PatientService, Restangular) ->
	$sessionStorage.user = $scope.user
	$scope.init = ->
		Restangular.all('patients').getList().then (patients) ->
			$scope.patients = patients
	$scope.$on 'handleReloadPatients', ->
		$scope.init()
	$scope.$on 'handleBroadcastId', ->
		$scope.currentPatientId = PatientService.id
		Restangular.one('patients', $scope.currentPatientId).all('family_members').getList().then (family) ->
			$scope.family = family
	$scope.selectPatient = ->
		if $scope.currentPatientId != ""
			Restangular.one('patients', $scope.currentPatientId).all('family_members').getList().then (family) ->
				$scope.family = family
			$location.path('/' + $scope.currentPatientId) 
	$scope.new = ->
		$scope.currentPatientId = ""
		$location.path('/new')
]
				
