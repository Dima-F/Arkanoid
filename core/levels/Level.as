package core.levels {
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import core.*;
	import core.bricks.*;
	public class Level {
		public function createBricks():Array {
			var map: Array = this.getMap();
			var bricks:Array = new Array();
			for (var i = 0; i < map.length; i++) {
				for (var j = 0; j < map[i].length; j++) {
					if (map[i][j] !== 0) {
						var nova:Sprite;
						switch(map[i][j]){
							case 1:
								nova = new BlueBrick();
							break;
							case 2:
								nova = new GreenBrick();
							break;
							case 3:
								nova = new RedBrick();
							break;
							default:
								throw new IllegalOperationError("Type "+map[i][j]+ " of brick is not implemented");
						}
						nova.x = (j * 45) + 25;
						nova.y = (i * 25) + 25;
						Effects.applyShadow(nova);
						bricks.unshift(nova);
					}
				}
			}
			return bricks;
		}
		//abstract method
		protected function getMap():Array{
			throw new IllegalOperationError("You have to override getMap method in derived classes...");
		}
	}
}