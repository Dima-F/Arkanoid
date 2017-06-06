package core  {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public final class Ball extends MovieClip {
		
		private var speedX:int;
		private var speedY:int;
		public function Ball(startPoint:Point) {
			// constructor code
			this.speedX=5;
			this.speedY=5;
			this.x=startPoint.x;
			this.y=startPoint.y;
		}
		public function move():void{
			this.x+=speedX;
			this.y+=speedY;
		}
		public function invertX():void{
			this.speedX*=-1;
		}
		public function invertY():void{
			this.speedY*=-1;
		}
		public function normalize():void{
			this.speedX=5;
			this.speedY=5;
		}
	}
	
}