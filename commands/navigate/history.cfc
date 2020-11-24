/**
* List all history
* 
* {code:bash}
* navigate history 
* {code}
*
*/
component aliases='history' {

	/**
	* 
	*/
	function run( ) {
		var configSettings = ConfigService.getconfigSettings();
		cfparam (name='configSettings.modules["commandbox-navigate"].history', default=[]);
		cfparam (name='configSettings.modules["commandbox-navigate"].historyIndex', default=1);
		history = configSettings.modules['commandbox-navigate'].history;
		historyIndex = configSettings.modules['commandbox-navigate'].historyIndex;
 		valueLen = 0;
		for ( var k in history ) {
			valueLen = max(valueLen, k.len());
		}

		if ( history.len() ) {
			print.yellowLine(repeatString('-', valueLen + 6));
			count = 0;
			for ( var i in history ) {
				count++;
				print
					.yellowText('| ')
					.greenText(historyIndex == count?'* ':'  ')
					.text(i & repeatString(' ', valueLen - i.len()))
					.yellowText(' |')
					.line();
			};
			
			print.yellowLine(repeatString('-', valueLen + 6));
		} else {
			print.text('There are no history to display.');
		} 			
	}
}