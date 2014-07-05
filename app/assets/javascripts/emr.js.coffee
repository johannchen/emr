angular.module('emrApp', ['restangular', 'ngRoute', 'ngStorage', 'ui.select2', 'xeditable', 'pascalprecht.translate', 'emr.filters', 'util.service', 'patient.service'])
	.config(['$httpProvider', ($httpProvider) ->
		authToken = $("meta[name=\"csrf-token\"]").attr("content")
		$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
	])
	.config(['$routeProvider', ($routeProvider) ->
		$routeProvider.when "/dictionary", controller: 'DictionaryCtrl', templateUrl: '/templates/dictionary.html'
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
	.config(['$translateProvider', ($translateProvider) ->
		$translateProvider.translations 'en',
			Abdomen: 'Abdomen'
			Address: 'Address'
			AddAllergy: 'Add Allergy'
			AddDiagnosis: 'Add Diagnosis'
			AddMedication: 'Add Medication'
			AddSocialHistory: 'Add Social History'
			AddSurgery: 'Add Surgery'
			Age: 'Age'
			Allergies: 'Allergies'
			Assessment: 'Assessment'
			Back: 'Back'
			Birthday: 'Birthday'
			BMI: 'BMI'
			BP: 'BP'
			Breast: 'Breast'
			Cardiac: 'Cardiac'
			Charity: 'Charity'
			City: 'City'
			Company: 'Company'
			CreatedAt: 'Created At'
			CurrentMedications: 'Current Medications'
			CURRENT_PATIENT: 'Current Patient'
			Description: 'Description'
			Details: 'Details'
			Diagnosis: 'Diagnosis'
			Dictionary: 'Dictionary'
			District: 'District'
			DOB: 'DOB'
			Edit: 'Edit'
			Editor: 'Editor'
			Email: 'Email'
			Extremities: 'Extremities'
			Family: 'Family/Relatives'
			FamilyHistory: 'Family History'
			Female: 'Female'
			FirstName: 'First name'
			FollowUp: 'Follow up'
			General: 'General'
			GU: 'GU'
			HC: 'HC'
			HEENT: 'HEENT'
			Hospice: 'Hospice'
			Ht: 'Ht'
			Insurance: 'Medical Insurance'
			Lab: 'Lab'
			LastName: 'Last name'
			LastUpdated: 'Last Updated'
			LastUpdatedBy: 'Last Updated By'
			LastUpdatedOn: 'Last Updated On'
			LastVisit: 'Last Visit'
			LOG_OUT: 'Log out'
			Male: 'Male'
			Medication: 'Medication'
			Name: 'Name'
			Nationality: 'Nationality'
			Neck: 'Neck'
			NewPatient: 'New Patient'
			NewVisit: 'New Visit'
			Neuro: 'Neuro'
			O2: 'O2'
			Occupation: 'Occupation'
			P: 'P'
			PastMedicalHistory: 'Past Medical History'
			PastMedications: 'Past Medications'
			PATIENT: 'Patient'
			Phone: 'Phone'
			PhysicalExam: 'Physical Exam'
			Profile: 'Profile'
			Province: 'State'
			Psych: 'Psych'
			Reaction: 'Reaction'
			RecentVisits: 'Recent Visits'
			Rectal: 'Rectal'
			Relation: 'Relation'
			Respiratory: 'Respiratory'
			RR: 'RR'
			Save: 'Save'
			Script: 'Script'
			SIGN_IN: 'Sign in'
			SelectPatient: 'Select Patient'
			Skin: 'Skin'
			SocialHistory: 'Social History'
			Start: 'Start'
			Stop: 'Start'
			Street: 'Street'
			Subjective: 'Subjective'
			Summary: 'Summary'
			Surgery: 'Surgery'
			SurgicalHistory: 'Surgical History'
			T: 'T'
			Treatment: 'Treatment' 
			TreatmentNote: '(If any new medicine prescription or allergy reaction, please add them at the patient history)'
			USER: 'Users'
			VisitDate: 'Visit Date'
			Visits: 'Visits'
			VitalSigns: 'Vital Signs'
			Wt: 'Wt'
			Year: 'Year'
			

		$translateProvider.translations 'zh',
			Abdomen: '腹部'
			Address: '地址'
			AddAllergy: '新过敏'
			AddDiagnosis: '新诊断'
			AddMedication: '新现用药物'
			AddSocialHistory: '新生活方式'
			AddSurgery: '新手术'
			Age: '年龄'
			Allergies: '过敏'
			Assessment: '诊断'
			Back: '腰部'
			Birthday: '生日'
			BMI: '身体质量指数'
			Breast: '乳腺检查'
			BP: '血压'
			Cardiac: '心脏检查'
			Charity: '慈善'
			City: '城市'
			Company: '公司'
			CreatedAt: '创建时间'
			CurrentMedications: '现用药物'
			CURRENT_PATIENT: '病人'
			Description: '详情'
			Department: '门诊部门'
			Details: '详情'
			Diagnosis: '诊断'
			Dictionary: '词典管理'
			District: '区'
			DOB: '生日'
			Edit: '修改'
			Editor: '修改人'
			Email: '电子邮件'
			Extremities: '四肢检查'
			Family: '家属'
			FamilyHistory: '家族史'
			Female: '女'
			FirstName: '名'
			FollowUp: '跟进'
			General: '一般情况'
			GU: '泌尿系统'
			HC: '头围'
			HEENT: '头耳鼻喉颈部'
			Hospice: '临终关怀'
			Ht: '高度'
			Insurance: '医疗保险'
			Lab: '化验'
			LastName: '姓'
			LastUpdated: '上次修改时间'
			LastUpdatedBy: '上次修改人'
			LastUpdatedOn: '上次修改时间'
			LastVisit: '上次门诊'
			LOG_OUT: '退出'
			Male: '男'
			Medication: '药物'
			Name: '名称'
			Nationality: '国籍'
			Neck: '颈部'
			NewPatient: '新病人'
			NewVisit: '新门诊'
			Neuro: '神经系统'
			O2: '血氧饱和度'
			Occupation: '职业'
			P: '脉搏'
			PastMedicalHistory: '既往病史'
			PastMedications: '过去药物'
			PATIENT: '病人'
			Phone: '电话'
			PhysicalExam: '体检'
			Profile: '个人信息'
			Province: '省'
			Psych: '精神健康'
			Reaction: '过敏反应'
			RecentVisits: '最近门诊'
			Rectal: '直肠／肛门检查'
			Relation: '关系'
			Respiratory: '呼吸系统'
			RR: '呼吸率'
			Save: '存储'
			Script: '药物用法'
			SIGN_IN: '登录'
			SelectPatient: '选择病人'
			Skin: '皮肤检查'
			SocialHistory: '生活方式'
			Start: '开始'
			Stop: '停止'
			Street: '街'
			Subjective: '主诉'
			Summary: '病史'
			Surgery: '手术'
			SurgicalHistory: '手术史'
			T: '体温'
			Treatment: '治疗计划'
			TreatmentNote: '（若开新药物或有新过敏，请再次记录在病史里）'
			USER: '用户管理'
			Visits: '门诊'
			VisitDate: '门诊日期'
			VitalSigns: '生命体症'
			Wt: '体重'
			Year: '年份'
		$translateProvider.preferredLanguage 'zh'
	])
	.run(['editableOptions', (editableOptions) ->
		editableOptions.theme = 'bs3'
	])
	

# Makes AngularJS work with turbolinks
$(document).on 'page:load', ->
	$('[ng-app]').each ->
		module = $(this).attr('ng-app')
		angular.bootstrap(this, [module])

