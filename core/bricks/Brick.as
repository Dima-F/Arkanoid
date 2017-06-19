package core.bricks  {
	
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	
	public class Brick extends MovieClip {
		
		protected var power:int;
		public function Brick() {
			// constructor code
			reDraw();
		}
		public function hit():void {
			power--;
			reDraw();
		}
		public function hasPower():Boolean {
			return power>0;
		}
		protected function reDraw():void{
			throw new IllegalOperationError();
		}
	}
	
}
