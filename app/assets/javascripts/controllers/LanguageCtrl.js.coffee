angular.module('emrApp').controller 'LanguageCtrl', ['$scope', '$translate', ($scope, $translate) ->
	$scope.isChinese = true
	$scope.changeLanguage = (key) ->
		$translate.use(key) 
		$scope.isChinese = !$scope.isChinese
]
