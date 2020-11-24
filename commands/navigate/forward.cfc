/**
* Navigate forwards through directory history
*/
component aliases='fwd,navigate >' {

	/**
	* @step Number of steps to traverse
	*/
	function run ( number index=1 ) {
		var configSettings = ConfigService.getconfigSettings();

		cfparam (name='configSettings.modules["commandbox-navigate"].history', default=[]);
		cfparam (name='configSettings.modules["commandbox-navigate"].historyIndex', default=1);
		history      = configSettings.modules['commandbox-navigate'].history;
 		historyIndex = configSettings.modules['commandbox-navigate'].historyIndex;		
		historyIndex -= abs(arguments.step);
		historyIndex = historyIndex < 1? 1 : historyIndex;
		configSettings.modules['commandbox-navigate'].historyIndex = historyIndex;

		ConfigService.setConfigSettings( configSettings );
		command('cd').params(
			directory         = history[historyIndex]?:'',
			bypassSaveHistory = true
		).run();
 	}
}