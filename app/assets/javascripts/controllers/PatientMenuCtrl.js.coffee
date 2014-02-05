angular.module('emrApp').controller 'PatientMenuCtrl', ['$scope', '$location', 'PatientService', 'Restangular', ($scope, $location, PatientService, Restangular) ->
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
				
