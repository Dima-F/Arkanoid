package screens  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import labels.*;
	import buttons.*;
	
	public class AboutScreen extends BasicScreen {
		private var backButton:Sprite;
		public function AboutScreen(owner:INavigate) {
			super(owner);
			addChild(new Label('About screen',20));
			
			backButton = new RichButton('back');
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
