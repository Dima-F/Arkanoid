package labels  {
	import flash.text.*;
	
	public class Label extends TextField {

		public function Label(title:String, size:uint) {
			// constructor code
			//creating format
			var format:TextFormat = new TextFormat();
			format.font = 'Verdana';
			format.bold = true;
			format.size = size;
			//creating textField
			autoSize = TextFieldAutoSize.LEFT;
			type = TextFieldType.INPUT;
			selectable=false;
			text = title;
			setTextFormat(format);
		}

	}
	
}
