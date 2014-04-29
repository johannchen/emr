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
		$routeProvider.when "/:patientId/profile", controller: 'PatientProfileCtrl', templateUrl: '/templates/patient_profile.html'
		$routeProvider.when "/:patientId/edit", controller: 'PatientUpdateCtrl', templateUrl: '/templates/patient_form.html'
		# diagnoses
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
		# family
		$routeProvider.when "/:patientId/family/:id",
			controller: 'FamilyCtrl'
			templateUrl: '/templates/family.html'
			resolve:
			  family: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('family_members', $route.current.params.id).get()
				]
		$routeProvider.when "/:patientId/family/:id/edit",
      controller: 'FamilyUpdateCtrl'
      templateUrl: '/templates/family_form.html' 
		# medications
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
		# allergies 
 		$routeProvider.when "/:patientId/allergies",
      controller: 'PatientAllergiesCtrl'
      templateUrl: '/templates/patient_allergies.html'
		$routeProvider.when "/:patientId/new_allergy", 
			controller: 'AllergyCreateCtrl'
			templateUrl: '/templates/allergy_form.html'
		$routeProvider.when "/:patientId/allergies/:id",
			controller: 'AllergyCtrl'
			templateUrl: '/templates/allergy.html'
			resolve:
			  allergy: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('allergies', $route.current.params.id).get()
        ]	
		$routeProvider.when "/:patientId/allergies/:id/edit",
      controller: 'AllergyUpdateCtrl'
      templateUrl: '/templates/allergy_form.html' 
		# behaviors (social history) 
 		$routeProvider.when "/:patientId/behaviors",
      controller: 'PatientBehaviorsCtrl'
      templateUrl: '/templates/patient_behaviors.html'
		$routeProvider.when "/:patientId/new_behavior", 
			controller: 'BehaviorCreateCtrl'
			templateUrl: '/templates/behavior_form.html'
		$routeProvider.when "/:patientId/behaviors/:id",
			controller: 'BehaviorCtrl'
			templateUrl: '/templates/behavior.html'
			resolve:
			  behavior: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('behaviors', $route.current.params.id).get()
        ]	
		$routeProvider.when "/:patientId/behaviors/:id/edit",
      controller: 'BehaviorUpdateCtrl'
      templateUrl: '/templates/behavior_form.html' 
		# surgeries
		$routeProvider.when "/:patientId/surgeries",
      controller: 'PatientSurgeriesCtrl'
      templateUrl: '/templates/patient_surgeries.html'
		$routeProvider.when "/:patientId/new_surgery", 
			controller: 'SurgeryCreateCtrl'
			templateUrl: '/templates/surgery_form.html'
		$routeProvider.when "/:patientId/surgeries/:id",
			controller: 'SurgeryCtrl'
			templateUrl: '/templates/surgery.html'
			resolve:
			  surgery: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('surgeries', $route.current.params.id).get()
        ]	
		$routeProvider.when "/:patientId/surgeries/:id/edit",
      controller: 'SurgeryUpdateCtrl'
      templateUrl: '/templates/surgery_form.html' 
		# visits
 		$routeProvider.when "/:patientId/visits",
      controller: 'PatientVisitsCtrl'
      templateUrl: '/templates/patient_visits.html'
		$routeProvider.when "/:patientId/new_visit", 
			controller: 'VisitCreateCtrl'
			templateUrl: '/templates/visit_form.html'
		$routeProvider.when "/:patientId/visits/:id",
			controller: 'VisitCtrl'
			templateUrl: '/templates/visit.html'
			resolve:
			  visit: ['$route', 'Restangular', ($route, Restangular) ->
          Restangular.one('patients', $route.current.params.patientId).one('visits', $route.current.params.id).get()
        ]	
		$routeProvider.when "/:patientId/visits/:id/edit",
      controller: 'VisitUpdateCtrl'
      templateUrl: '/templates/visit_form.html' 
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

