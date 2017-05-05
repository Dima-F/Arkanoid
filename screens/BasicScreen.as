package screens {
	
	import flash.display.Sprite;
	
	public class BasicScreen extends Sprite implements IDisposable {
		protected var _owner:INavigate;
		public function BasicScreen(owner:INavigate) {
			_owner=owner;
		}
		public function dispose():void {}
	}
}
