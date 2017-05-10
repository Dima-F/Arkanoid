package screens {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import labels.*;
	import buttons.*;

	public class SettingsScreen extends BasicScreen {

		public function SettingsScreen(owner:INavigate) {
			super(owner,"Settings");
			var backButton = new RichButton('Return');
			backButton.x=120;
			backButton.y=400;
			addChild(backButton);
			backButton.addEventListener(MouseEvent.CLICK, backHandler,false,0,true);
		}
		private function backHandler(e:MouseEvent):void{
			_owner.showMenu();
		}

	}
	
}
