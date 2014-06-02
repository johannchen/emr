angular.module('emrApp').controller 'SurgeryCreateCtrl', ['$scope', '$routeParams', '$location', 'Restangular', 'UtilService', ($scope, $routeParams, $location, Restangular, UtilService) ->
	patientId = $routeParams.patientId
	$scope.surgs = Restangular.all('surgery_names').getList().$object
	$scope.save = ->
		index = UtilService.findIndexByKeyValue($scope.surgs, "name", $scope.surgery.name)
		if index == -1
			Restangular.all("surgery_names").post({name: $scope.surgery.name}).then (surg) ->
		Restangular.one('patients', patientId).all("surgeries").post($scope.surgery).then (surgery) ->
			$location.path('/' + patientId + '/surgeries')
]
