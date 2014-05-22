patientService = angular.module('patient.service', [])
patientService.factory "PatientService", ['$rootScope', ($rootScope) ->
	id: ""
	broadcastId: (id) ->
		@id = id
		$rootScope.$broadcast('handleBroadcastId')
	reloadPatients: ->
		$rootScope.$broadcast('handleReloadPatients')
	age: (dateString) ->
		birthday = +new Date(dateString)
		~~((Date.now() - birthday) / (31557600000))
]
