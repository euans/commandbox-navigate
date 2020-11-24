/**
* Delete history by index
*/
component aliases='history -' {

	/**
	* @index Index of history to delete
	*/
	function run ( string name, string path=getCWD() ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-navigate"].history', default={});
		history = configSettings.modules['commandbox-navigate'].history;
 		
 		if ( !isNull(arguments.name) ) {
 			structDelete(bookmarks, trim(arguments.name));
 		} else {
 			for ( item in bookmarks ) {
 				if ( bookmarks[item] == arguments.path ) {
 					structDelete(bookmarks, item);
 				}
 			}
 		}	

 		ConfigService.setConfigSettings( configSettings );

 		print.greenLine('History Removed.')
	}

}