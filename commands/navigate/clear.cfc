/**
* Remove all history
*/
component {

	function run ( ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-navigate"].history', default={});
		history = configSettings.modules['commandbox-navigate'].history;
 		
 		if ( confirm('Are you sure you want to remove all history?') ) {
 			history.clear();
 			ConfigService.setConfigSettings( configSettings );
 			print.greenLine('History Cleared.');
 		}
 		
	}
}