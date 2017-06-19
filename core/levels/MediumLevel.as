package core.levels {
	public class MediumLevel extends Level {
		protected override function getMap():Array{
			return [
			[0, 1, 1, 1, 1, 2],
			[1, 1, 1, 0, 2, 1],
			[1, 2, 2, 0, 1, 2],
			[2, 0, 2, 1, 2, 0],
			[1, 0, 1, 1, 0, 1],
			[1, 2, 2, 1, 1, 1]
		];
		}
	}
}