package core.balls {
	public class SuperBall extends Ball {
		public function SuperBall(maxWidth: int, maxHeight: int) {
			super(maxWidth, maxHeight);
		}
		override public function drawBall(): void {
			gotoAndStop("Orange Ball");
		}
		override public function arm():void {
			this.speedX = 11;
			this.speedY = 11;
		}
	}
}