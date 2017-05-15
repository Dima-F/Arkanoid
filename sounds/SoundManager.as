package sounds  {
	import flash.media.*;
	import flash.utils.*;
	import sounds.*;
	
	public final class SoundManager {
		
		public static var SoundOn:Boolean = true;
		
		private static var Sounds:Dictionary;
		
		public static function initialize():void{
			Sounds = new Dictionary();
			Sounds["Puddle"] = new sounds.PuddleSound();
			Sounds["Pop"] = new sounds.PopSound();
		}
		public static function play(sound:String):void
		{
			if(SoundOn == false)
				return;
			Sound(Sounds[sound]).play(0,0);
		}

	}
	
}
