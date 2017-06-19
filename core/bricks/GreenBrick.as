package core.bricks {
	public class GreenBrick extends Brick {
		public function GreenBrick(){
			this.power=3;
			super();
		}
		protected override function reDraw():void{
			switch(this.power){
				case 3:
				case 2: gotoAndStop("Green Brick Normal");
				break;
				case 0:
				case 1: gotoAndStop("Green Brick Cracked");
				break;
				default:throw new Error("can't reDraw brick with zero power");
			}
		}
	}
}