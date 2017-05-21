package core {
	import flash.events.*;
	import flash.utils.Timer;

	public class Game extends EventDispatcher{
		public static const GAME_OVER:String = "gameOver";
		public function Game():void{
			endGame();
		}
		private function endGame():void{
			//code for ending game
			var timer:Timer = new Timer(10000,1);
			timer.addEventListener(TimerEvent.TIMER,timerHandler);
			timer.start();
		}
		private function timerHandler(e:TimerEvent):void {
			dispatchEvent(new Event(Game.GAME_OVER));
		}
	}
}