package core.balls {

	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;

	public class Ball extends MovieClip {
		
		protected var speedX: int;
		protected var speedY: int;
		protected var maxWidth: int;
		protected var maxHeight: int;
		protected var moving:Boolean = false;

		public function Ball(maxWidth: int, maxHeight: int) {
			// constructor code
			this.maxWidth = maxWidth;
			this.maxHeight = maxHeight;
			this.arm();
		}
		
		public function isMoving():Boolean {
			return this.moving;
		}
		
		// Абстрактный метод (должен быть замещен в подклассе)
		public function drawBall(): void {
			throw new IllegalOperationError("Abstract method drawBall should be overriden!");
		}

		public function setLoc(xLoc: int, yLoc: int): void {
			this.x = xLoc;
			this.y = yLoc;
		}

		public function arm(): void {
			// Устанавливает скорость мяча по умолчанию (5 пикселов в кадр)
			this.speedX = 5;
			this.speedY = 5;
		}
		
		public function pause():void {
			this.speedX = 0;
			this.speedY = 0;
		}
		
		public function normalize(): void {
			this.speedX = Math.abs(this.speedX);
			this.speedY = Math.abs(this.speedY);
		}

		public function invertX(): void {
			this.speedX *= -1;
		}

		public function invertY(): void {
			this.speedY *= -1;
		}

		public function moreSpeed(k: int): void {
			this.speedX *= k;
			this.speedY *= k;
		}
		
		public function doMove(): void {
			this.x += speedX;
			this.y += speedY;
			
		}

		

	}

}