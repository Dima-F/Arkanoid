package labels  {
	import flash.text.*;
	
	public class Label extends TextField {
		private var _format:TextFormat;
		public function Label(title:String, size:uint, color:uint) {
			// constructor code
			//creating format
			_format = new TextFormat();
			embedFonts=true;
			_format.font='Kristen ITC';
			_format.bold = true;
			_format.size = size;
			_format.color=color;
			
			//creating textField
			autoSize = TextFieldAutoSize.LEFT;
			selectable=false;
			text = title;
			setTextFormat(_format);
		}
		public function update():void{
			setTextFormat(_format);
		}

	}
	
}
