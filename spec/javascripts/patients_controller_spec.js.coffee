describe "Patients controller", ->
	beforeEach module("emrApp")

	describe "Index", ->
		it "should set patients to an empty array", inject(($controller) ->
			scope = {}
			ctrl = $controller("PatientsController",
				$scope: scope
			)

			scope.init()
			expect(scope.patients.length).toBe 2
		)
