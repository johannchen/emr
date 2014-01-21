angular.module('emrApp', ['ngRoute'])
	.config(['$routeProvider', ($routeProvider) -> 
		$routeProvider.when '/', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
		$routeProvider.when '/patients', templateUrl: '/templates/patients.html', controller: 'PatientsController'
	])

