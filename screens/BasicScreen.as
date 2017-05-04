package screens {
	
	import flash.display.Sprite;
	
	public class BasicScreen extends Sprite {
		protected var _owner:INavigate;
		public function BasicScreen(owner:INavigate) {
			_owner=owner;
		}
	}
}
