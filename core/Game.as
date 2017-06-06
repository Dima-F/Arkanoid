package core {
	import flash.events.*;
	import flash.utils.*;
	import flash.display.*;
	import flash.filters.DropShadowFilter;
	import sounds.*;
	import flash.ui.Keyboard;
	import flash.geom.Point;

	public final class Game extends MovieClip {
		public static const GAME_OVER: String = "gameOver";
		private const _WIDTH: Number = 320;
		private const _HEIGHT: Number = 400;
		private var rightPressed: Boolean = false;
		private var leftPressed: Boolean = false;
		private var xstep = 20;
		private var ystep = 20;
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball: Ball;
		private var bat: Bat;
		private const LEVEL_1: Array = [
			[0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 1, 1, 0, 0, 0],
			[0, 0, 0, 1, 1, 0, 0, 0],
			[0, 1, 1, 1, 1, 1, 1, 0],
			[0, 1, 1, 1, 1, 1, 1, 0],
			[0, 0, 0, 1, 1, 0, 0, 0],
			[0, 0, 0, 1, 1, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0],
		];

		private const LEVEL_2: Array = [
			[0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 1, 1, 0, 0, 0],
			[0, 0, 1, 0, 0, 1, 0, 0],
			[0, 0, 0, 0, 0, 1, 0, 0],
			[0, 0, 0, 0, 1, 0, 0, 0],
			[0, 0, 0, 1, 0, 0, 0, 0],
			[0, 0, 1, 0, 0, 0, 0, 0],
			[0, 0, 1, 1, 1, 1, 0, 0],
		]; //this forms a number 2!
		private var gameEvent: String = ''; //stores events like win, lose, gameover 
		private var currentLevel: int = 0;
		private var lives: int = 3;
		private var levels: Array = []; //stores the levels

		public function Game(): void {
			//levels.push(LEVEL_1, LEVEL_2);
			addEventListener(Event.ADDED_TO_STAGE, initializeGame, false, 0, true);
		}

		private function initializeGame(e: Event): void {
			stage.addEventListener(Event.ENTER_FRAME, gameLoop, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			ball = new Ball(new Point(_WIDTH / 2,_HEIGHT / 1.5));
			applyShadow(ball);
			addChild(ball);
			bat = new Bat(new Point(_WIDTH / 2,_HEIGHT * 0.9));
			applyShadow(bat);
			addChild(bat);
			createBricks();
			stage.focus=this;
		}

		private function keyDownHandler(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.RIGHT) {
				rightPressed = true;
			} else if (e.keyCode == Keyboard.LEFT) {
				leftPressed = true;
			}
		}

		private function keyUpHandler(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.RIGHT) {
				rightPressed = false;
			} else if (e.keyCode == Keyboard.LEFT) {
				leftPressed = false;
			}
		}

		public function clear(): void {
			removeChild(ball);
			ball = null;
			removeChild(bat);
			bat = null;
			for (var i = 0; i < bricks.length; i++) {
				removeChild(bricks[i]);
				bricks[i] = null;
			}
			bricks = null;
			stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function gameLoop(e: Event): void {
			if (lives > 0) {
				if (rightPressed) {
					bat.moveR();
					if (bat.x >= _WIDTH - bat.width) {
						bat.x = _WIDTH - bat.width;
					}
				}

				if (leftPressed) {
					bat.moveL();
					if (bat.x <= 0) {
						bat.x = 0;
					}
				}
				ball.move();

				if (ball.hitTestObject(bat)) {
					ball.invertY();
					SoundManager.play("Puddle");
				}
				if (ball.x + ball.width >= _WIDTH) {
					ball.invertX();
					SoundManager.play("Puddle");
				}
				if (ball.y <= 0) {
					ball.invertY();
					SoundManager.play("Puddle");
				}
				if (ball.x <= 0) {
					ball.invertX();
					SoundManager.play("Puddle");
				}
				for (var i = 0; i < bricks.length; i++) {
					if (ball.hitTestObject(bricks[i])) {
						SoundManager.play("Pop");
						removeChild(bricks[i]);
						bricks.splice(i, 1);
						ball.invertY();
					}
				}
				//exit game if ball is out
				if (ball.y > _HEIGHT) {
					lives--;
				}
			} else {
				dispatchEvent(new Event(Game.GAME_OVER));
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
					xstep = 20;
				}
			}
		}

		private function applyShadow(target: Sprite): void {
			var ds: DropShadowFilter = new DropShadowFilter();
			ds.distance = 5;
			ds.blurX = 10;
			ds.blurY = 10;
			ds.alpha = 0.6;
			target.filters = [ds];
		}
	}
}