package screens {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import labels.*;
	import flash.filters.*;
	
	public class BasicScreen extends Sprite implements IDisposable {
		protected var _owner:INavigate;
		public function BasicScreen(owner:INavigate,title:String) {
			_owner=owner;
			addTitle(title);
		}
		public function dispose():void {}
		private function addTitle(title:String):void{
			var titleField:TextField = new Label(title,28, 0xFFFF00);
			titleField.y=75;
			titleField.x=160-titleField.width/2;
			var ds:DropShadowFilter = new DropShadowFilter();
			ds.distance=2;
			ds.alpha=0.8;
			titleField.filters=[ds];
			addChild(titleField);
		}
	}
}
