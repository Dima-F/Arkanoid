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
		private var level:Level = new Level();
		
		//private var gameEvent: String = ''; //stores events like win, lose, gameover 
		private var lives: int = 3;

		public function Game(): void {
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
		
		private function restartRound(){
			ball.x=_WIDTH / 2;
			ball.y=_HEIGHT / 1.5;
			ball.normalize();
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
					bat.width+=
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
						bricks[i].hit();
						if(!bricks[i].hasPower()){
							removeChild(bricks[i]);
							bricks.splice(i, 1);
						}
						ball.invertY();
					}
				}
				//exit game if ball is out
				if (ball.y > _HEIGHT) {
					lives--;
					restartRound();
				}
			} else {
				dispatchEvent(new Event(Game.GAME_OVER));
			}

		}

		private function createBricks(): void {
			var levelArray:Array = level.getCurrent();
			for(var i=0;i<levelArray.length;i++){
				for(var j=0; j<levelArray[j].length;j++){
					if(levelArray[i][j]!==0){
						var nova: Sprite = new Brick();
						nova.x = (i*45)+20;
						nova.y = (j*25)+20;
						applyShadow(nova);
						bricks.unshift(nova);
						addChild(nova);
					}
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