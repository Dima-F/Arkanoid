package core.balls {
	public class FastBall extends Ball {
		public function FastBall(maxWidth: int, maxHeight: int) {
			super(maxWidth, maxHeight);
		}
		override public function drawBall(): void {
			gotoAndStop("Yellow Ball");
		}
		override public function arm():void {
			this.speedX = 9;
			this.speedY = 9;
		}
	}
}