package core.levels {
	public class SimpleLevel extends Level {
		protected override function getMap():Array{
				return [
				[0, 1, 1, 1, 1, 0],
				[1, 0, 0, 0, 0, 1],
				[1, 1, 1, 0, 1, 1],
				[0, 0, 1, 1, 1, 0],
				[1, 0, 1, 1, 0, 1],
				[1, 1, 1, 1, 1, 1]
			];
		}
	}
}