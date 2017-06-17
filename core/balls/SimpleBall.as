package core.balls  {
	public class SimpleBall extends Ball {
		public function SimpleBall(maxWidth:int,maxHeight:int) {
			super(maxWidth,maxHeight);
			this.gotoAndStop("Gray Ball");
		}
		/*
		override public function drawBall(): void {
			
		}*/
	}
}