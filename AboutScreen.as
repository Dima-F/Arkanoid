﻿package  {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class AboutScreen extends MovieClip {
		private var _owner:INavigate;
		private var backButton:SimpleButton;
		public function AboutScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			backButton=new BackButton();
			backButton.x=120;
			backButton.y=200;
			addChild(backButton);
			
			backButton.addEventListener(MouseEvent.CLICK, backHandler);
		}
		private function backHandler(e:MouseEvent):void{
			_owner.showMenu();
		}
	}
	
}
