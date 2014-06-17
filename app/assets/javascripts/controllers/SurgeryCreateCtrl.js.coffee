angular.module('emrApp').controller 'SurgeryCreateCtrl', ['$scope', '$routeParams', '$location', '$sessionStorage', 'Restangular', 'UtilService', ($scope, $routeParams, $location, $sessionStorage, Restangular, UtilService) ->
	$scope.patientId = $routeParams.patientId
	$scope.patient = $sessionStorage.patient
	$scope.surgs = Restangular.all('surgery_names').getList().$object
	$scope.save = ->
		index = UtilService.findIndexByKeyValue($scope.surgs, "name", $scope.surgery.name)
		if index == -1
			Restangular.all("surgery_names").post({name: $scope.surgery.name}).then (surg) ->
		Restangular.one('patients', $scope.patientId).all("surgeries").post($scope.surgery).then (surgery) ->
			$location.path('/' + $scope.patientId + '/surgeries')
]
