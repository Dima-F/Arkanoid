package screens {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import labels.*;
	import buttons.*;

	public class SettingsScreen extends BasicScreen {

		public function SettingsScreen(owner:INavigate) {
			super(owner);
			addChild(new Label('Settings screen',20));
			
			var backButton = new RichButton('back');
			backButton.x=120;
			backButton.y=200;
			addChild(backButton);
			backButton.addEventListener(MouseEvent.CLICK, backHandler,false,0,true);
		}
		private function backHandler(e:MouseEvent):void{
			_owner.showMenu();
		}

	}
	
}
