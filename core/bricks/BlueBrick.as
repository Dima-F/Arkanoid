package core.bricks {
	public class BlueBrick extends Brick {
		public function BlueBrick(){
			this.power=2;
			super();
		}
		protected override function reDraw():void{
			switch(this.power){
				case 2: gotoAndStop("Blue Brick Normal");
				break;
				case 0:
				case 1: gotoAndStop("Blue Brick Cracked");
				break;
				default:throw new Error("can't reDraw brick with zero power");
			}
		}
	}
}