package core {

	public final class Level {
		/*private const LEVEL_1: Array = [
			[0, 1, 1, 1, 1, 0],
			[1, 0, 0, 0, 0, 1],
			[1, 1, 0, 0, 1, 1],
			[0, 0, 1, 1, 0, 0],
			[1, 0, 1, 1, 0, 1],
			[1, 1, 1, 1, 1, 1]
		];

		private const LEVEL_2: Array = [
			[1, 1, 1, 1, 1, 1],
			[1, 0, 0, 0, 0, 1],
			[1, 1, 0, 0, 1, 1],
			[1, 1, 1, 1, 1, 1],
			[1, 0, 1, 1, 0, 1],
			[1, 1, 1, 1, 1, 1]
		];
		private const LEVEL_3: Array = [
			[1, 1, 1, 1, 1, 1],
			[1, 1, 0, 0, 1, 1],
			[1, 1, 1, 1, 1, 1],
			[1, 1, 0, 1, 0, 1],
			[1, 1, 0, 1, 0, 1],
			[1, 1, 1, 1, 1, 1]
		];*/
		private const LEVEL_1:Array = [
			[0,1],
			[1,0]
		];
		private const LEVEL_2:Array = [
			[1,1],
			[1,0]
		];
		private const LEVEL_3:Array = [
			[1,1],
			[1,1]
		];
		private const MAPS: Array = [LEVEL_1,LEVEL_2,LEVEL_3];
		private var currentIndexLevel:uint;
		public function Level() {
			// constructor code
			currentIndexLevel=0;
		}
		public function getCurrent():Array {
			return MAPS[currentIndexLevel];
		}
		public function next():Boolean {
			if(currentIndexLevel >= MAPS.length-1){
				return false;
			} else {
				currentIndexLevel++;
				return true;
			}
		}
	}

}