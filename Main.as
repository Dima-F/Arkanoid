package {
	import flash.display.*;
	import flash.ui.*;
	import flash.events.*;
	import flash.text.*;
	import screens.*;
	import sounds.*;


	public final class Main extends MovieClip implements INavigate {

		private var menuScreen: BasicScreen; 
		private var aboutScreen: BasicScreen;
		private var gameScreen: BasicScreen;
		private var settingsScreen: BasicScreen;

		public function Main() {
			showMenu();
			SoundManager.initialize();
		}
		public function showMenu(): void {
			if (aboutScreen) {
				removeChild(aboutScreen);
				aboutScreen = null;
			}
			if (settingsScreen) {
				removeChild(settingsScreen);
				settingsScreen = null;
			}
			if (gameScreen) {
				removeChild(gameScreen);
				gameScreen = null;
			}
			menuScreen = new MenuScreen(this);
			addChild(menuScreen);
		}
		public function showGame(): void {
			if (menuScreen) {
				removeChild(menuScreen);
				menuScreen = null;
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
		public function showSettings():void{
			removeChild(menuScreen);
			menuScreen = null;
			settingsScreen = new SettingsScreen(this);
			addChild(settingsScreen);
		}
	}
}