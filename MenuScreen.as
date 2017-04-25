package  {
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	
	public class MenuScreen extends Sprite {
		private var _owner:INavigate;
		private var playButton:SimpleButton;
		private var aboutButton:SimpleButton;
		public function MenuScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			playButton = new PlayButton();
			playButton.x=120;
			playButton.y=200;
			addChild(playButton);
			aboutButton = new AboutButton();
			aboutButton.x=110;
			aboutButton.y=260;
			addChild(aboutButton);
			
			playButton.addEventListener(MouseEvent.CLICK,playHandler);
			aboutButton.addEventListener(MouseEvent.CLICK, aboutHandler);
		}
		private function aboutHandler(e:MouseEvent):void{
			_owner.showAbout();
		}
		private function playHandler(e:MouseEvent):void{
			_owner.showGame();
		}
	}
}
