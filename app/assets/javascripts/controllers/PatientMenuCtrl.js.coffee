angular.module('emrApp').controller 'PatientMenuCtrl', ['$scope', '$location', '$sessionStorage', 'PatientService', 'Restangular', ($scope, $location, $sessionStorage, PatientService, Restangular) ->
	$sessionStorage.user = $scope.user
	$scope.init = ->
		Restangular.all('patients').getList().then (patients) ->
			$scope.patients = patients
	$scope.$on 'handleReloadPatients', ->
		$scope.init()
	$scope.$on 'handleBroadcastSid', ->
		$scope.currentPatientId = PatientService.sid
	$scope.selectPatient = ->
		$location.path('/' + $scope.currentPatientId) if $scope.currentPatientId != ""
	$scope.new = ->
		$scope.currentPatientId = ""
		$location.path('/new')
]
				
