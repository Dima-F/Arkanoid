package core  {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public final class Bat extends MovieClip {
		
		private var speed:Number;
		private var timer:Timer = new Timer(5000,1);
		
		
		public function Bat(startPoint:Point) {
			// constructor code
			speed=8;
			this.x = startPoint.x-this.width/2;
			this.y = startPoint.y;
			timer.addEventListener(TimerEvent.TIMER,lessWidth);
		}
		public function moveR():void{
			this.x +=speed;
		}
		public function moveL():void{
			this.x -=speed;
		}
		public function moreWidth():void {
			this.width*=1.5;
			timer.start();
		}
		public function lessWidth(e:TimerEvent):void {
			this.width/=1.5;
			//timer.stop();
		}
	}
	
}
