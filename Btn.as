package  {
	
	import flash.display.SimpleButton;
	import flash.text.TextField;
	
	
	public class Btn extends SimpleButton {
		public function Btn(title:String) {
			// constructor code
			var text:TextField=new TextField();
			text.text=title;
			//addChild(text);
		}
	}
	
}
