package core  {
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	
	public final class Effects {

		public function Effects() {
			// constructor code
		}
		public static function applyShadow(target: Sprite): void {
			var ds: DropShadowFilter = new DropShadowFilter();
			ds.distance = 5;
			ds.blurX = 10;
			ds.blurY = 10;
			ds.alpha = 0.6;
			target.filters = [ds];
		}
	}
	
}
