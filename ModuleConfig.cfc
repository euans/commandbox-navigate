component {

	function configure () {
		settings     = {
			history    = [],
			historyMax = 25
		};
		interceptors = [
            { class='#moduleMapping#.interceptors.navigate' }
        ];
	}
	
}