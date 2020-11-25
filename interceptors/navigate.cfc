component {
	property name='ConfigService' inject='ConfigService';
	//property name='consoleLogger'	inject='logbox:logger:console';

	function postCommand ( interceptData ) {
		var configSettings = ConfigService.getconfigSettings();
		
		cfparam (name='configSettings.modules["commandbox-navigate"].history', default=[]);
		cfparam (name='configSettings.modules["commandbox-navigate"].historyMax', default=25);
		cfparam (name='configSettings.modules["commandbox-navigate"].historyIndex', default=1);
		var history      = configSettings.modules["commandbox-navigate"].history;
		var historyMax   = configSettings.modules["commandbox-navigate"].historyMax;
		var historyIndex = configSettings.modules["commandbox-navigate"].historyIndex;

		if ( 
			listFindNoCase('cd', interceptData.commandInfo.commandString) &&
			!(interceptData.parameterInfo.namedParameters.bypassSaveHistory?:false) &&
			val(historyMax) &&
			(history[1]?:'') != interceptData.result
		) {
			configSettings.modules["commandbox-navigate"].history = history.mid(historyIndex, historyMax).prepend(interceptData.result);
			configSettings.modules["commandbox-navigate"].historyIndex = 1;
			ConfigService.setConfigSettings( configSettings );
			//consoleLogger.debug(serialize(interceptData.parameterInfo));
		}		
	}
}