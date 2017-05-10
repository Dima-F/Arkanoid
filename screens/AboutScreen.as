package screens  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import labels.*;
	import buttons.*;
	
	public class AboutScreen extends BasicScreen {
		private var backButton:Sprite;
		public function AboutScreen(owner:INavigate) {
			super(owner,"About program");
			
			backButton = new RichButton('Return');
			backButton.x=120
			backButton.y=400;
			addChild(backButton);
			backButton.addEventListener(MouseEvent.CLICK, backHandler,false,0,true);
		}
		private function backHandler(e:MouseEvent):void{
			_owner.showMenu();
		}
	}
	
}
