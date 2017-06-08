package core {
	import flash.events.*;
	import flash.utils.*;
	import flash.display.*;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	import sounds.*;

	public final class Game extends MovieClip {
		public static const GAME_OVER: String = "gameOver";
		public static const LIVES_DOWN: String = "livesDown";
		//public static const LIVES_UP: String = "livesUp";
		private const _WIDTH: Number = 320;
		private const _HEIGHT: Number = 400;
		private var started:Boolean = false;
		private var rightPressed: Boolean = false;
		private var leftPressed: Boolean = false;
		private var xstep = 20;
		private var ystep = 20;
		private var bricks: Vector.<Brick> = new Vector.<Brick>();
		private var ball: Ball;
		private var bat: Bat;
		private var level:Level = new Level();
		
		private var lives: int = 3;

		public function Game(): void {
			addEventListener(Event.ADDED_TO_STAGE, initializeGame, false, 0, true);
		}

		private function initializeGame(e: Event): void {
			stage.addEventListener(Event.ENTER_FRAME, gameLoop, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler, false, 0, true);
			ball = new Ball(new Point(_WIDTH / 2,_HEIGHT / 1.5));
			Effects.applyShadow(ball);
			addChild(ball);
			bat = new Bat(new Point(_WIDTH / 2,_HEIGHT * 0.9));
			Effects.applyShadow(bat);
			addChild(bat);
			createBricks();
			stage.focus=this;
		}
		
		private function livesDown():void {
			lives--;
			if(lives>0){
				restartRound();
				dispatchEvent(new Event(Game.LIVES_DOWN));
			} else {
				dispatchEvent(new Event(Game.GAME_OVER));
			}
		}
		
		private function toggleGame():void {
			started=!started;
		}
		
		private function restartRound(){
			ball.x=_WIDTH / 2;
			ball.y=_HEIGHT / 1.5;
			ball.normalize();
			toggleGame();
		}
		
		private function keyDownHandler(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.RIGHT) {
				rightPressed = true;
			} else if (e.keyCode == Keyboard.LEFT) {
				leftPressed = true;
			} else if(e.keyCode == Keyboard.SPACE){
				toggleGame();
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
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		private function gameLoop(e: Event): void {
				if (rightPressed) {
					bat.moveR();
					if (bat.x >= _WIDTH - bat.width) {
						bat.x = _WIDTH - bat.width;
					}
				} else if (leftPressed) {
					bat.width+=
					bat.moveL();
					if (bat.x <= 0) {
						bat.x = 0;
					}
				}
				if(started){
					ball.move();
				}
				
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
							if(bricks.length==0){
								if(level.next()){
									bat.moreWidth();
									ball.moreSpeed();
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
				
				//ball is out
				if (ball.y > _HEIGHT) {
					livesDown();
				}

		}

		private function createBricks(): void {
			var levelArray:Array = level.getCurrent();
			for(var i=0;i<levelArray.length;i++){
				for(var j=0;j<levelArray[i].length;j++){
					if(levelArray[i][j]!==0){
						var nova: Sprite = new Brick();
						nova.x = (j*45)+25;
						nova.y = (i*25)+25;
						Effects.applyShadow(nova);
						bricks.unshift(nova);
						addChild(nova);
					}
				}
			}
		}
	}
}