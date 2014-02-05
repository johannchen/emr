angular.module('emrApp', ['restangular', 'ngRoute', 'ui.select2', 'patient.service'])
	.config(['$httpProvider', ($httpProvider) ->
		authToken = $("meta[name=\"csrf-token\"]").attr("content")
		$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
	])
	.config(['$routeProvider', ($routeProvider) -> 
		$routeProvider.when "/new", controller: 'PatientCreateCtrl', templateUrl: '/templates/patient_form.html'
		$routeProvider.when "/:patientId", 
			controller: 'PatientShowCtrl'
			templateUrl: '/templates/patient_show.html'
			resolve:
				patient: ['$route', 'Restangular', ($route, Restangular) ->
					Restangular.one('patients', $route.current.params.patientId).get()
				]
		$routeProvider.when "/:patientId/edit", controller: 'PatientUpdateCtrl', templateUrl: '/templates/patient_form.html'
	])
	.config(['RestangularProvider', (RestangularProvider) ->
		#RestangularProvider.setBaseUrl('/')
		#RestangularProvider.setRestangularFields
		#	id: "sid"
	])

# Makes AngularJS work with turbolinks
$(document).on 'page:load', ->
	$('[ng-app]').each ->
		module = $(this).attr('ng-app')
		angular.bootstrap(this, [module])

