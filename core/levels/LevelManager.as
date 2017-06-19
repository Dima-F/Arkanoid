package core.levels {
	import flash.errors.IllegalOperationError;
	public class LevelManager {
		private var i:int=3;
		public  function next():Level{
			if(i>0){
				switch(i){
					case 3:
						i--;
						return new SimpleLevel();
					break;
					case 2:
						i--;
						return new MediumLevel();
					break;
					case 1:
						i--;
						return new HighLevel();
					break;
					default:
						throw new IllegalOperationError("Not implemented level");
				}
			} else return null;
		}
		
	}
}