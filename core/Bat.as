package core  {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public final class Bat extends MovieClip {
		
		private var speed:Number;
		
		public function Bat(startPoint:Point) {
			// constructor code
			speed=5;
			this.x = startPoint.x-this.width/2;
			this.y = startPoint.y;
		}
		public function moveR():void{
			this.x +=speed;
		}
		public function moveL():void{
			this.x -=speed;
		}
	}
	
}
