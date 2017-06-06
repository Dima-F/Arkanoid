package buttons  {
	
	import flash.display.*;
	import flash.text.*;
	import flash.filters.*;
	
	public class RichButton extends Sprite {
		private var _w:Number;
		private var _h:Number;
		private var _fSize:uint;
		private var _txt:String;
		private var _txtCol:uint;

		public function RichButton(txt:String,fSize:uint=12, w:Number=80, h:Number=30, txtCol:uint=0x000000) {
			_w = w;
			_h = h;
			_txt = txt;
			_txtCol = txtCol;
			_fSize = fSize;
			
			var btn:SimpleButton = createBtn();
			addChild(btn);
			var labl:TextField = createLabel();
			labl.mouseEnabled = false;
			addChild(labl);
		}
		private function createBtn() {
 			var btn:SimpleButton = new Btn();
			btn.width=_w;
			btn.height=_h;
			btn.name=_txt;
			var ds:DropShadowFilter = new DropShadowFilter();
			ds.distance=5;
			ds.alpha=0.6;
			btn.filters=[ds];
			return btn;
		}
		
		private function createLabel():TextField {
			var txt:TextField = new TextField();
			txt.width = _w;
			txt.height = _h;

			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = _txtCol;
			format.size = _fSize;
			format.bold = true;
			format.align = TextFormatAlign.CENTER
			txt.embedFonts=true;
			format.font='Kristen ITC';

			txt.defaultTextFormat = format;
			txt.text = _txt;
			txt.selectable = false;
			return txt;
		}

	}
	
}
