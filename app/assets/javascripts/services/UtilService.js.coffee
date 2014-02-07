angular.module('util.service', []).factory "UtilService", ->
	findIndexByKeyValue: (obj, key, value) ->
		i = 0
		while i < obj.length
			return i if obj[i][key] is value
			i++
		-1
