package screens {

	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.filters.DropShadowFilter;
	import sounds.*;
	import core.*;
	import flash.ui.GameInput;


	public final class GameScreen extends BasicScreen {

		private var game: Game;
		
		public function GameScreen(owner: INavigate) {
			// constructor code
			game = new Game();
			game.x = game.y = 0;
			addChild(game);
			game.addEventListener(Game.GAME_OVER, dispose);
			super(owner, "");
		}
		
		public function dispose(e:Event): void {
			game.clear();
			_owner.showMenu();
		}

	}

}