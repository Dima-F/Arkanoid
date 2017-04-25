package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	
	public class GameScreen extends MovieClip {
		private var xstep = 50;
		private var ystep = 50;
		private var ballX = 3;
		private var ballY = 3;
		private var radius = 8;
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball:Ball;
		private var paddle:Paddle;
		
		
		private var _owner:INavigate;
		private var _timer:Timer;
		public function GameScreen(owner:INavigate) {
			// constructor code
			_owner=owner;
			addEventListener(Event.ADDED_TO_STAGE, initializeGame);
		}
		private function initializeGame(e:Event):void {
			addEventListener(MouseEvent.MOUSE_MOVE, movePaddle);
			addEventListener(Event.ENTER_FRAME, enterF);
			ball = new Ball();
			ball.x=stage.stageWidth/2;
			ball.y=stage.stageHeight/2;
			addChild(ball);
			paddle=new Paddle();
			paddle.x=200;
			paddle.y=400;
			addChild(paddle);
			createBricks();
		}
		private function movePaddle(e:MouseEvent):void{
			if(e.localX<stage.stageWidth-paddle.width){
				paddle.x = e.localX;
			}
		}
		private function enterF(e: Event): void {
			ball.x += ballX;
			ball.y += ballY;
			
			if (ball.hitTestObject(paddle)) {
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
			for (var i = 0; i < bricks.length; i++) {
				if (ball.hitTestObject(bricks[i])) {
					removeChild(bricks[i]);
					bricks.splice(i, 1);
					ballY *= -1;

				}
			}
		}
		private function createBricks(): void {
			for (var i = 1; i < 21; i++) {
				var nova: Sprite = new Brick();
				nova.x = xstep;
				nova.y = ystep;
				bricks.unshift(nova);
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
