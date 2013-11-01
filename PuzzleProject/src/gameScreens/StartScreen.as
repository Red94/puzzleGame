package gameScreens 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Elroy&Rachel
	 */
	public class StartScreen extends MC_StartScreen
	{
		
		
		public function StartScreen() 
		{
			startButton.addEventListener(MouseEvent.CLICK, startGame);
			levelEditorButton.addEventListener(MouseEvent.CLICK, gotoLevelEditor);
		}
		
		private function gotoLevelEditor(e:MouseEvent):void 
		{
			Constants.screenManager.openNewScreen(2); // level editor screen
		}
		
		private function startGame(e:MouseEvent):void 
		{
			Constants.screenManager.openNewScreen(1); // game screen
		}
		
		public function init():void 
		{
			
		}
		
		public function loop():void 
		{
			
		}
		
	}

}