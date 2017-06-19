package core.bricks {
	public class RedBrick extends Brick {
		public function RedBrick(){
			this.power=4;
			super();
		}
		protected override function reDraw():void{.0
			switch(this.power){
				case 4:
				case 3:
					gotoAndStop("Red Brick Normal");
				break;
				case 0:
				case 1: 
				case 2:
					gotoAndStop("Red Brick Cracked");
				break;
				default:throw new Error("can't reDraw brick with zero power");
			}
		}
	}
}