package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	
	public class GameScreen extends MovieClip {
		private var _owner:INavigate;
		private var _timer:Timer;
		public function GameScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			_timer=new Timer(5000,1);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
			_timer.start();
		}
		private function timerHandler(e:TimerEvent):void{
			_owner.showOver();
		}
	}
	
}
