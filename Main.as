package {

	import flash.display.*;
	import flash.ui.*;
	import flash.events.*;
	//import com.greensock.TweenNano;
	//import com.greensock.easing.Circ;


	public class Main extends MovieClip implements INavigate {
		
		private const BRICK_W: int = 39; //brick's width 
		private const BRICK_H: int = 19; //brick's height 
		private const OFFSET: int = 6; //An offset used to center the bricks 
		private const W_LEN: int = 8; //the length of the levels, only 8 horizontal bricks should be created on stage 
		private const SCORE_CONST: int = 100; //the amount to add to the score when a brick is hit 
		
		private var bricks: Vector.<Sprite> = new Vector.<Sprite>(); //stores all the bricks 
		private var xSpeed: int = 5;
		private var ySpeed: int = -5;
		private var xDir: int = 1; //x direction 
		private var yDir: int = 1;
		private var gameEvent: String = ''; //stores events like win, lose, gameover 
		private var currentLevel: int = 0;
		private var menuScreen: MenuScreen; //an instance of the menu screen 
		private var aboutScreen: AboutScreen;
		private var gameScreen: GameScreen;
		//private var alertScreen: AlertScreen;
		private var lives: int = 3;
		private var levels: Array = []; //stores the levels

		
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
		public function Main() {
			// constructor code
			/* Add Levels */ 
					 
			levels.push(LEVEL_1, LEVEL_2); //we add the levels to the array in order to know how many they are 
					 
			/* Menu Screen, Buttons Listeners */ 
			showMenu();
			
		}
		public function showMenu():void{
			menuScreen = new MenuScreen(this);
			addChild(menuScreen); 
		}
		public function showGame():void{
			gameScreen = new GameScreen(this);
			addChild(gameScreen);
			
		}
		public function showAbout():void{
			aboutScreen = new AboutScreen(this);
			addChild(aboutScreen);
			
		}
		public function showOver():void{
			
		}
	}

}