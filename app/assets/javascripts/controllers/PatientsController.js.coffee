angular.module('emrApp').controller 'PatientsController', ($scope) ->
	$scope.init = ->
		$scope.patients = [ "John", "Brian"]
