angular.module('emr.filters', []).filter 'active', ->
	(input) ->
		input if !input.stop

