package {
	import screens.*;
	import flash.display.*;
	import flash.ui.*;
	import flash.events.*;
	import flash.text.*;


	public class Main extends MovieClip implements INavigate {

		private var menuScreen: BasicScreen; 
		private var aboutScreen: BasicScreen;
		private var gameScreen: BasicScreen;
		private var settingsScreen: BasicScreen;

		public function Main() {
			showMenu();
		}
		public function showMenu(): void {
			if (aboutScreen) {
				aboutScreen.dispose();
				removeChild(aboutScreen);
				aboutScreen = null;
			}
			if (settingsScreen) {
				settingsScreen.dispose();
				removeChild(settingsScreen);
				settingsScreen = null;
			}
			if (gameScreen) {
				gameScreen.dispose();
				removeChild(gameScreen);
				gameScreen = null;
			}
			menuScreen = new MenuScreen(this);
			addChild(menuScreen);
		}
		public function showGame(): void {
			if (menuScreen) {
				menuScreen.dispose();
				removeChild(menuScreen);
				menuScreen = null;
			}
			gameScreen = new GameScreen(this);
			addChild(gameScreen);
		}
		public function showAbout(): void {
			menuScreen.dispose();
			removeChild(menuScreen);
			menuScreen = null;
			aboutScreen = new AboutScreen(this);
			addChild(aboutScreen);
		}
		public function showSettings():void{
			menuScreen.dispose();
			removeChild(menuScreen);
			menuScreen = null;
			settingsScreen = new SettingsScreen(this);
			addChild(settingsScreen);
		}
	}
}