package screens {

	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.filters.DropShadowFilter;
	import sounds.*;
	import core.*;
	import labels.Label;
	import events.*;

	public final class GameScreen extends BasicScreen {

		private var game: Game;
		private var starClip:Star;
		private var pointsField:Label;
		
		public function GameScreen(owner: INavigate) {
			// game init...
			game = new Game();
			game.x = game.y = 0;
			addChild(game);
			super(owner, "");
			//subscribing for events...
			game.addEventListener(Game.GAME_OVER, disposeGame, false, 0, true);
			game.addEventListener(Game.LIVES_DOWN, removeStar, false, 0, true);
			game.addEventListener(Game.POINTS_CHANGED, updatePoinsLabel, false, 0, true);
			//star init...
			starClip = new Star(10,420);
			addChild(starClip);
			//points field init...
			pointsField = new Label("0",18, 0xFF0000);
			pointsField.x=240;
			pointsField.y=420;
			addChild(pointsField);
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
		private function updatePoinsLabel(e:Event):void{
			pointsField.text="I";
			pointsField.update();
		}

	}

}