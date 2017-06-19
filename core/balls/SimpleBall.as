package core.balls  {
	public class SimpleBall extends Ball {
		public function SimpleBall(maxWidth:int,maxHeight:int) {
			super(maxWidth,maxHeight);
		}
		override public function drawBall(): void {
			this.gotoAndStop("Gray Ball");
		}
		override public function arm():void {
			this.speedX = 7;
			this.speedY = 7;
		}
	}
}