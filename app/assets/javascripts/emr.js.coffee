angular.module('emrApp', ['restangular', 'ngRoute', 'ngStorage', 'ui.select2', 'xeditable', 'util.service', 'patient.service'])
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
		$routeProvider.when "/:patientId/diagnoses",
      controller: 'PatientDiagnosesCtrl'
      templateUrl: '/templates/patient_diagnoses.html'
		$routeProvider.when "/:patientId/new_diagnosis", 
			controller: 'DiagnosisCreateCtrl'
			templateUrl: '/templates/diagnosis_form.html'
		$routeProvider.when "/:patientId/diagnoses/:id",
      controller: 'DiagnosisCtrl'
      templateUrl: '/templates/diagnosis.html' 
		$routeProvider.when "/:patientId/diagnoses/:id/edit",
      controller: 'DiagnosisUpdateCtrl'
      templateUrl: '/templates/diagnosis_form.html' 
		$routeProvider.when "/:patientId/medications",
      controller: 'PatientMedicationsCtrl'
      templateUrl: '/templates/patient_medications.html'
		$routeProvider.when "/:patientId/new_medication", 
			controller: 'MedicationCreateCtrl'
			templateUrl: '/templates/medication_form.html'
		$routeProvider.when "/:patientId/medications/:id",
			controller: 'MedicationCtrl'
			templateUrl: '/templates/medication.html'
			resolve:
			  medication: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('medications', $route.current.params.id).get()
        ]	
		$routeProvider.when "/:patientId/medications/:id/edit",
      controller: 'MedicationUpdateCtrl'
      templateUrl: '/templates/medication_form.html' 
		$routeProvider.when "/edit_history/:model/:id",
      controller: 'EditHistoryCtrl'
      templateUrl: '/templates/edit_history.html' 
	])
	.config(['RestangularProvider', (RestangularProvider) ->
		#RestangularProvider.setBaseUrl('/')
		RestangularProvider.setRestangularFields
			id: "id.$oid"
	])
	.run(['editableOptions', (editableOptions) ->
		editableOptions.theme = 'bs3'
	])

# Makes AngularJS work with turbolinks
$(document).on 'page:load', ->
	$('[ng-app]').each ->
		module = $(this).attr('ng-app')
		angular.bootstrap(this, [module])

