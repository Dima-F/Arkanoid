package core.levels {
	public class HighLevel extends Level {
		protected override function getMap():Array{
			return [
			[0, 1, 1, 2, 1, 3],
			[1, 1, 1, 3, 3, 3],
			[3, 2, 2, 0, 2, 3],
			[2, 0, 2, 3, 3, 3],
			[3, 2, 1, 3, 2, 2],
			[3, 3, 3, 3, 1, 2]
		];
		}
	}
}