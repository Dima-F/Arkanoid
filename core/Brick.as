package core  {
	
	import flash.display.MovieClip;
	
	
	public class Brick extends MovieClip {
		
		protected var power:int;
		public function Brick() {
			// constructor code
			gotoAndStop("Blue Brick Normal");
			power=2;
		}
		public function hit():void {
			power--;
			gotoAndStop("Blue Brick Cracked");
		}
		public function hasPower():Boolean {
			return power>0;
		}
	}
	
}
