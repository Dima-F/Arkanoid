package labels  {
	import flash.text.*;
	
	public class Label extends TextField {

		public function Label(title:String, size:uint, color:uint) {
			// constructor code
			//creating format
			var format:TextFormat = new TextFormat();
			embedFonts=true;
			format.font='Kristen ITC';
			format.bold = true;
			format.size = size;
			format.color=color;
			//creating textField
			autoSize = TextFieldAutoSize.LEFT;
			selectable=false;
			text = title;
			setTextFormat(format);
		}

	}
	
}
