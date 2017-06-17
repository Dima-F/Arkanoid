package core {

	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.*;

	public final
	class Bat extends MovieClip {

		private var speed: Number;
		private var timer: Timer = new Timer(5000, 1);

		public function Bat(startPoint: Point) {
			this.x = startPoint.x - this.width / 2;
			this.y = startPoint.y;
			this.speed = 8;
			addEventListener(Event.ADDED_TO_STAGE, this.initBat, false, 0, true);
		}
		private function initBat(event: Event): void {
			timer.addEventListener(TimerEvent.TIMER, this.lessWidth, false, 0, true);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.doMoveBat, false, 0, true);
			//this.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.doFire);
		}
		private function doMoveBat(event: MouseEvent): void {
			if ((event.stageX < this.stage.stageWidth - this.width) && event.stageX>0) {
				this.x = event.stageX;
				event.updateAfterEvent(); // обработать это событие в первую очередь
			}
		}

		public function moreWidth(): void {
			this.width *= 1.5;
			timer.start();
		}
		public function lessWidth(e: TimerEvent): void {
			this.width /= 1.5;
			//timer.stop();
		}
		public function clear():void {
			timer.removeEventListener(TimerEvent.TIMER, this.lessWidth);
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.doMoveBat);
		}
	}

}