/**
* Navigate backwards through directory history
*/
component aliases='back,<-' {

	/**
	* @step Number of steps to traverse
	*/
	function run ( number step=1 ) {
		var configSettings = ConfigService.getconfigSettings();

		cfparam (name='configSettings.modules["commandbox-navigate"].history', default=[]);
		cfparam (name='configSettings.modules["commandbox-navigate"].historyIndex', default=1);
		history      = configSettings.modules['commandbox-navigate'].history;
 		historyIndex = configSettings.modules['commandbox-navigate'].historyIndex;		
		historyIndex += abs(arguments.step);
		historyIndex = historyIndex > history.len()? history.len() : historyIndex;
		configSettings.modules['commandbox-navigate'].historyIndex = historyIndex;

		ConfigService.setConfigSettings( configSettings );
		command('cd').params(
			directory         = history[historyIndex]?:'',
			bypassSaveHistory = true
		).run();
 	}
}