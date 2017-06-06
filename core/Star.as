package core {
	
	import flash.display.MovieClip;
	
	
	public class Star extends MovieClip {
		
		private var currFrame:uint;
		public function Star(_x:Number,_y:Number) {
			// constructor code
			x=_x;
			y=_y;
			currFrame=3;
			gotoAndStop(currFrame);
		}
		public function downStar():void {
			if(currFrame>0){
				currFrame--;
				gotoAndStop(currFrame);
			} else {
				throw new Error("Wrong call func star.downStar()");
			}
		}
	}
	
}
