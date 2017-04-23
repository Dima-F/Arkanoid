package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	
	public class GameScreen extends MovieClip {
		private var xstep = 50;
		private var ystep = 50;
		private var keypress = 0;
		private var boardStep = 3;
		private var ballX = 3;
		private var ballY = 3;
		private var radius = 8;
		private var vector: Vector.<Brick> = new Vector.<Brick>();
		private var ball:Ball = new Ball();
		private var board:Paddle = new Paddle();
		
		
		private var _owner:INavigate;
		private var _timer:Timer;
		public function GameScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			_timer=new Timer(5000,1);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
			//_timer.start();
			addEventListener(Event.ENTER_FRAME, enterF);
			addEventListener(KeyboardEvent.KEY_DOWN, keyD);
			addEventListener(KeyboardEvent.KEY_UP, keyU);
			createBallAndPaddle();
			createB();
		}
		private function createBallAndPaddle():void{
			ball.x=200;
			ball.y=200;
			addChild(ball);
			board.x=200;
			board.y=400;
			addChild(board);
		}
		private function timerHandler(e:TimerEvent):void{
			_owner.showOver();
		}
		private function enterF(e: Event): void {
			ball.x += ballX;
			ball.y += ballY;
			switch (keypress) {
				case 37:
					board.x -= boardStep;
					break;
				case 39:
					board.x += boardStep;
					break;
			}
			if (ball.hitTestObject(board)) {
				ballY *= -1;
			}
			if (ball.x + radius >= stage.stageWidth) {
				ballX *= -1;
			}
			if (ball.y - radius <= 0) {
				ballY *= -1;
			}
			if (ball.x - radius <= 0) {
				ballX *= -1;
			}
			for (var i = 1; i < vector.length; i++) {
				if (ball.hitTestObject(vector[i])) {
					removeChild(vector[i]);
					vector.splice(i, 1);
					ballY *= -1;

				}
			}
		}
		private function keyD(e: KeyboardEvent): void {
			keypress = e.keyCode;
		}
		private function keyU(e: KeyboardEvent): void {
			keypress = 0;
		}
		private function createB(): void {
			for (var i = 1; i < 21; i++) {
				var nova: MovieClip = new Brick();
				nova.x = xstep;
				nova.y = ystep;
				vector.unshift(nova);
				addChild(vector[0]);
				addChild(nova);
				xstep += 55;
				if (i % 5 == 0) {
					ystep += 50;
					xstep = 50;
				}
			}
		}
	}
	
}
