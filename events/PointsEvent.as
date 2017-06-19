package events {
	import flash.events.Event;

	public class PointsEvent extends Event {
		public static const POINTS_CHANGED:String = "pointsChanged";
		public var val:int;
		public function PointsEvent(type:String,bubbles:Boolean=false, cancelable:Boolean=false, val:int=0){
			super(type,bubbles,cancelable);
			this.val=val;
		}
	}
}