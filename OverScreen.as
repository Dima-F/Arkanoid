package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class OverScreen extends Sprite {
		private var _owner:INavigate;
		private var playButton:SimpleButton;
		public function OverScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			playButton = new PlayButton();
			playButton.x=120;
			playButton.y=200;
			addChild(playButton);
			
			playButton.addEventListener(MouseEvent.CLICK,playHandler,false, 0 ,true);
		}
		private function playHandler(e:MouseEvent):void{
			_owner.showGame();
		}
	}
}
