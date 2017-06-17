package core.balls  {
	public class FastBall extends Ball {
		public function FastBall(maxWidth:int,maxHeight:int) {
			super(maxWidth,maxHeight);
			this.speedX*=2;
			this.speedY*=2;
			this.gotoAndStop("Yellow Ball");
		}
		/*
		override public function drawBall(): void {
			
		}*/
	}
}