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

	public final class Game extends MovieClip {
		public static const GAME_OVER: String = "gameOver";
		public static const LIVES_DOWN: String = "livesDown";
		public static const BALL_OUT: String = "ballOut";
		
		private const GAME_AREA: Rectangle = new Rectangle(0,0,320,400);
		private var lives: int = 3;
		private var points:int = 0;
		private var started: Boolean = false;
		private var xstep = 20;
		private var ystep = 20;
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball: Ball;
		private var bat: Bat;
		private var level: Level = new Level();

		

		public function Game(): void {
			addEventListener(Event.ADDED_TO_STAGE, initializeGame, false, 0, true);
			
		}

		private function initializeGame(e: Event): void {
			addEventListener(Event.ENTER_FRAME, gameLoop, false, 0, true);
			addEventListener(Game.BALL_OUT,livesDown,false, 0, true);
			ball = new FastBall(GAME_AREA.width,GAME_AREA.height);
			ball.setLoc(GAME_AREA.width/2, GAME_AREA.height / 1.5);
			ball.normalize();
			addEventListener(MouseEvent.CLICK,toggleGame);
			Effects.applyShadow(ball);
			addChild(ball);
			bat = new Bat(new Point(GAME_AREA.width / 2, GAME_AREA.height * 0.9));
			Effects.applyShadow(bat);
			addChild(bat);
			createBricks();
		}
		
		private function livesDown(e:Event): void {
			lives--;
			if (lives > 0) {
				restartRound();
				dispatchEvent(new Event(Game.LIVES_DOWN));
			} else {
				dispatchEvent(new Event(Game.GAME_OVER));
			}
		}

		private function toggleGame(e:MouseEvent): void {
			//
		}

		private function restartRound() {
			ball.setLoc(GAME_AREA.width/2, GAME_AREA.height / 1.5);
			ball.normalize();
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

		private function gameLoop(e: Event): void {
			ball.doMove();
			if (ball.hitTestObject(bat)) {
				ball.invertY();
				SoundManager.play("Puddle");
			}
			if (ball.x + ball.width >= GAME_AREA.width) {
				ball.invertX();
				SoundManager.play("Puddle");
			}
			if (ball.y <= GAME_AREA.y) {
				ball.invertY();
				SoundManager.play("Puddle");
			}
			if (ball.x <= GAME_AREA.x) {
				ball.invertX();
				SoundManager.play("Puddle");
			}
			//ball is out
			if (ball.y > GAME_AREA.height) {
				dispatchEvent(new Event(Game.BALL_OUT, true, false));
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
							if (level.next()) {
								bat.moreWidth();
								ball.moreSpeed(2);
								createBricks();
								restartRound();
							} else {
								dispatchEvent(new Event(Game.GAME_OVER));
								return;
							}
						}
					}
					ball.invertY();
				}
			}
		}
		private function increasePoints():void{
			this.points++;
			dispatchEvent(new Event(Game.POINTS_CHANGED));
		}

		private function createBricks(): void {
			var levelArray: Array = level.getCurrent();
			for (var i = 0; i < levelArray.length; i++) {
				for (var j = 0; j < levelArray[i].length; j++) {
					if (levelArray[i][j] !== 0) {
						var nova: Sprite = new Brick();
						nova.x = (j * 45) + 25;
						nova.y = (i * 25) + 25;
						Effects.applyShadow(nova);
						bricks.unshift(nova);
						addChild(nova);
					}
				}
			}
		}
	}

	
}