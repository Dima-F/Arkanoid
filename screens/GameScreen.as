package screens {

	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.filters.DropShadowFilter;
	import sounds.*;
	import core.*;

	public final class GameScreen extends BasicScreen {

		private var game: Game;
		private var starClip:Star;
		
		public function GameScreen(owner: INavigate) {
			// constructor code
			game = new Game();
			game.x = game.y = 0;
			addChild(game);
			game.addEventListener(Game.GAME_OVER, disposeGame, false, 0, true);
			game.addEventListener(Game.LIVES_DOWN, removeStar, false, 0, true);
			super(owner, "");
			starClip = new Star(10,420);
			addChild(starClip);
		}
		
		private function disposeGame(e:Event): void {
			game.clear();
			removeChild(game);
			game=null;
			_owner.showMenu();
		}
		private function removeStar(e:Event):void {
			starClip.downStar();
		}

	}

}