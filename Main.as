package {

	import flash.display.*;
	import flash.ui.*;
	import flash.events.*;
	//import com.greensock.TweenNano;
	//import com.greensock.easing.Circ;


	public class Main extends MovieClip implements INavigate {

		private var menuScreen: MenuScreen; //an instance of the menu screen 
		private var aboutScreen: AboutScreen;
		private var gameScreen: GameScreen;
		private var overScreen: OverScreen;

		public function Main() {
			showMenu();
		}
		public function showMenu(): void {
				if (aboutScreen) {
					removeChild(aboutScreen);
					aboutScreen = null;
				}
				menuScreen = new MenuScreen(this);
				addChild(menuScreen);
			}
			public function showGame(): void {
				if (menuScreen) {
					removeChild(menuScreen);
					menuScreen = null;
				}
				if (overScreen) {
					removeChild(overScreen);
					overScreen = null;
				}
				gameScreen = new GameScreen(this);
				addChild(gameScreen);
			}
			public function showAbout(): void {
				removeChild(menuScreen);
				menuScreen = null;
				aboutScreen = new AboutScreen(this);
				addChild(aboutScreen);
			}
			public function showOver(): void {
				removeChild(gameScreen);
				gameScreen = null;
				overScreen = new OverScreen(this);
				addChild(overScreen);
			}

	}
}