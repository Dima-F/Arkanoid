package screens  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.filters.DropShadowFilter;
	
	
	public class GameScreen extends BasicScreen {
		private var xstep = 50;
		private var ystep = 50;
		private var ballX = 3;
		private var ballY = 3;
		private var radius = 8;
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball:Ball;
		private var paddle:Paddle;
		private const LEVEL_1:Array = [[0,0,0,0,0,0,0,0], 
									   [0,0,0,0,0,0,0,0], 
									   [0,0,0,1,1,0,0,0], 
									   [0,0,0,1,1,0,0,0], 
									   [0,1,1,1,1,1,1,0], 
									   [0,1,1,1,1,1,1,0], 
									   [0,0,0,1,1,0,0,0], 
									   [0,0,0,1,1,0,0,0], 
									   [0,0,0,0,0,0,0,0],]; //this forms a + sign! 
		 
		private const LEVEL_2:Array = [[0,0,0,0,0,0,0,0], 
									   [0,0,0,1,1,0,0,0], 
									   [0,0,1,0,0,1,0,0], 
									   [0,0,0,0,0,1,0,0], 
									   [0,0,0,0,1,0,0,0], 
									   [0,0,0,1,0,0,0,0], 
									   [0,0,1,0,0,0,0,0], 
									   [0,0,1,1,1,1,0,0],]; //this forms a number 2!
		private var gameEvent: String = ''; //stores events like win, lose, gameover 
		private var currentLevel: int = 0;
		private var lives: int = 3;
		private var levels: Array = []; //stores the levels
		private var _timer:Timer;
		public function GameScreen(owner:INavigate) {
			// constructor code
			levels.push(LEVEL_1, LEVEL_2);
			super(owner,"");
			addEventListener(Event.ADDED_TO_STAGE, initializeGame,false, 0 ,true);
		}
		public override function dispose():void{
			removeChild(ball);
			ball=null;
			removeChild(paddle);
			paddle=null;
			for (var i = 0; i < bricks.length; i++) {
				removeChild(bricks[i]);
				bricks[i]=null;
			}
			bricks=null;
			removeEventListener(Event.ENTER_FRAME,enterF);
		}
		private function initializeGame(e:Event):void {
			addEventListener(MouseEvent.MOUSE_MOVE, movePaddle,false, 0, true);
			addEventListener(Event.ENTER_FRAME, enterF, false, 0 ,true);
			ball = new Ball();
			ball.x=stage.stageWidth/2;
			ball.y=stage.stageHeight/1.5;
			addChild(ball);
			paddle=new Paddle();
			paddle.x=stage.stageWidth/2-paddle.width/2;
			paddle.y=stage.stageHeight*0.9;
			applyShadow(paddle);
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
			//exit game if ball is out
			if(ball.y>stage.stageHeight){
				_owner.showMenu();
			}
		}
		private function createBricks(): void {
			for (var i = 1; i < 21; i++) {
				var nova: Sprite = new Brick();
				nova.x = xstep;
				nova.y = ystep;
				applyShadow(nova);
				bricks.unshift(nova);
				addChild(nova);
				xstep += 55;
				if (i % 5 == 0) {
					ystep += 50;
					xstep = 50;
				}
			}
		}
		private function applyShadow(target:Sprite):void {
			var ds:DropShadowFilter = new DropShadowFilter();
			ds.distance=5;
			ds.blurX=10;
			ds.blurY=10;
			ds.alpha=0.6;
			target.filters=[ds];
		}
	}
	
}
