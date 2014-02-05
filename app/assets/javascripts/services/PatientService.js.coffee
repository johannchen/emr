patientService = angular.module('patient.service', [])
patientService.factory "PatientService", ['$rootScope', ($rootScope) ->
	sid: ""
	broadcastSid: (sid) ->
		@sid = sid
		$rootScope.$broadcast('handleBroadcastSid')
	reloadPatients: ->
		$rootScope.$broadcast('handleReloadPatients')
	age: (dateString) ->
		birthday = +new Date(dateString)
		~~((Date.now() - birthday) / (31557600000))
]
