angular.module('emrApp').controller 'EditHistoryCtrl', ['$scope', '$route', 'Restangular', ($scope, $route, Restangular) ->
	model = $route.current.params.model
	id = $route.current.params.id
	base = Restangular.one(model, id)
]
