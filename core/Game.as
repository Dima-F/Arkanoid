package core {
	import flash.events.*;
	import flash.utils.*;
	import flash.display.*;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import sounds.*;
	import core.balls.*;
	import events.*;
	import core.levels.*;
	import core.bricks.*;

	public final class Game extends MovieClip {
		public static const GAME_OVER: String = "gameOver";
		public static const LIVES_DOWN: String = "livesDown";
		public static const BALL_OUT: String = "ballOut";
		
		private const GAME_AREA: Rectangle = new Rectangle(0,0,320,400);
		private var lives: int = 3;
		private var points:int = 0;
		//private var started: Boolean = false;
		
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball: Ball;
		private var bat: Bat;
		private var level: Level;
		private var levelManager:LevelManager;

		public function Game(): void {
			addEventListener(Event.ADDED_TO_STAGE, initializeGame, false, 0, true);
			levelManager = new LevelManager();
			level = levelManager.next();
		}
		
		private function initializeGame(e: Event): void {
			addEventListener(Event.ENTER_FRAME, gameLoop, false, 0, true);
			addEventListener(Game.BALL_OUT,livesDown,false, 0, true);

			startRound();
			
			bat = new Bat(new Point(GAME_AREA.width / 2, GAME_AREA.height * 0.9));
			Effects.applyShadow(bat);
			addChild(bat);
			createBricks();
		}
		
		private function livesDown(e:Event): void {
			lives--;
			if (lives > 0) {
				startRound();
				dispatchEvent(new Event(Game.LIVES_DOWN));
			} else {
				dispatchEvent(new Event(Game.GAME_OVER));
			}
		}
		private function startRound() {
			if(ball){
				removeChild(ball);
				ball=null;
			}
			ball = createBall();
			ball.setLoc(GAME_AREA.width/2, GAME_AREA.height / 1.5);
			ball.normalize();
			addChild(ball);
		}

		public function clear(): void {
			removeChild(ball);
			ball=null;
			bat.clear();
			removeChild(bat);
			bat = null;
			for (var i = 0; i < bricks.length; i++) {
				removeChild(bricks[i]);
				bricks[i] = null;
			}
			bricks = null;
			removeEventListener(Event.ENTER_FRAME, gameLoop);
		}
		//need to refactor this method...
		private function gameLoop(e: Event): void {
			ball.doMove();
			if (ball.hitTestObject(bat)) {
				ball.invertY();
				SoundManager.play("Puddle");
				return;
			}
			if (ball.x + ball.width >= GAME_AREA.width) {
				ball.invertX();
				SoundManager.play("Puddle");
				return;
			}
			if (ball.y <= GAME_AREA.y) {
				ball.invertY();
				SoundManager.play("Puddle");
				return;
			}
			if (ball.x <= GAME_AREA.x) {
				ball.invertX();
				SoundManager.play("Puddle");
				return;
			}
			//ball is out
			if (ball.y > GAME_AREA.height) {
				dispatchEvent(new Event(Game.BALL_OUT, true, false));
				return;
			}
			for (var i = 0; i < bricks.length; i++) {
				if (ball.hitTestObject(bricks[i])) {
					SoundManager.play("Pop");
					bricks[i].hit();
					if (!bricks[i].hasPower()) {
						removeChild(bricks[i]);
						bricks.splice(i, 1);
						increasePoints();
						if (bricks.length == 0) {
							level = levelManager.next();
							if (level) {
								createBricks();
								startRound();
							} else {
								dispatchEvent(new Event(Game.GAME_OVER));
								return;
							}
						}
					}
					ball.invertY();
					return;
				}
			}
		}
		
		private function increasePoints():void{
			this.points++;
			dispatchEvent(new PointsEvent(PointsEvent.POINTS_CHANGED,false,false,this.points));
		}
		//need to move in separate class...
		private function createBricks(): void {
			var levelBricks:Array = level.createBricks();
			for(var i:int=0;i<levelBricks.length;i++){
				bricks.unshift(levelBricks[i]);
				addChild(DisplayObject(levelBricks[i]));
			}
		}
		//need to move in separate class...
		private  function createBall():Ball {
			if(level is SimpleLevel){
				return new SimpleBall(GAME_AREA.width,GAME_AREA.height);
				trace('simple');
			}
			if(level is HighLevel){
				trace('high');
				return new SuperBall(GAME_AREA.width,GAME_AREA.height);
			} else return new FastBall(GAME_AREA.width,GAME_AREA.height);
		}
	}
}