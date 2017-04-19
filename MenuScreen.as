package  {
	
	import flash.display.*;
	import flash.text.*;
	
	
	public class MenuScreen extends MovieClip {
		
		private var playButton:TextField;
		public function MenuScreen(core:INavigate) {
			// constructor code
			playButton = new TextField();
			addChild(playButton);
		}
	}
}
