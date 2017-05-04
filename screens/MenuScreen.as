package screens {

	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import labels.*;

	public class MenuScreen extends BasicScreen {

		public function MenuScreen(owner: INavigate) {
			// constructor code
			super(owner);
			createButtons(["Play", "About", "Settings", "Exit"]);
			addChild(new Label('Welcome to Arkanoid',20));
		}
		private function createButtons(btns: Array): void {
			for (var i: Number = 0; i < btns.length; i++) {
				var btn: SimpleButton = new Btn(btns[i]);
				btn.x = 20 + i * 100;
				btn.y = 400;
				btn.name = btns[i];
				btn.addEventListener(MouseEvent.CLICK, onNav, false, 0, true);
				addChild(btn);
			}
		}
		private function onNav(e: MouseEvent): void {
			switch (e.target.name) {
				case "Play":
					_owner.showGame();
					break;
				case "About":
					_owner.showAbout();
					break;
				case "Settings":
					_owner.showSettings();
					break;
			}
		}
	}
}