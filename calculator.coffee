calculator = ($scope) ->

	$scope.size = 1

	# in units/second
	$scope.speed = 1

	# Values in bits
	$scope.units = [
		{ label: "byte", value: 8 }
		{ label: "KB (kilobyte)", value: 1024 *8 }
		{ label: "MB (megabyte)", value: Math.pow(1024,2) *8}
		{ label: "GB (gigabyte)", value: Math.pow(1024,3) *8}
		{ label: "TB (terabyte)", value: Math.pow(1024,4) *8}
		{ label: "Kb (kilobit)", value: 1000 }
		{ label: "Mb (megabit)", value: Math.pow(1000,2) }
		{ label: "Gb (gigabit)", value: Math.pow(1000,3) }
		{ label: "Tb (terabit)", value: Math.pow(1000,4) }
	]

	# default to megabytes
	$scope.selectedSizeUnit = $scope.units[3]
	$scope.selectedSpeedUnit = $scope.units[3]

	###
	@return duration string
	###
	$scope.timeToDownload = ->
		seconds = ($scope.size * $scope.selectedSizeUnit.value) / ($scope.speed * $scope.selectedSpeedUnit.value)
		duration = new Duration "#{seconds}s"
		duration.toString()


angular.module("calculatorApp", []).controller "CalculatorController", calculator