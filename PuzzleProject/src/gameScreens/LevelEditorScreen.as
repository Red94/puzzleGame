package gameScreens 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import levelEditor.EditBlock;
	/**
	 * ...
	 * @author Groep3
	 */
	public class LevelEditorScreen extends MovieClip
	{
		public var saveButton:MC_SaveButton;
		public var blockStorage:Array = new Array();
		
		public function LevelEditorScreen() 
		{	
			saveButton = new MC_SaveButton();
			saveButton.x = 4;
			saveButton.y = 596 - saveButton.height;
			addChild(saveButton);
			
			for (var y:int = 0; y < 8; y++)
			{
				for (var x:int = 0; x < 10; x++) 
				{
					var editBlock:EditBlock = new EditBlock(x * 64, y * 64);
					blockStorage.push(editBlock);
					addChild(editBlock);
				}
			}
			
			Constants.STAGE.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void 
		{
			for (var i:int = 0; i < blockStorage.length; i++)
			{
				if (blockStorage[i].hitTestPoint(mouseX, mouseY))
				{
					if (blockStorage[i].currentFrame < blockStorage[i].totalFrames)
					{
						blockStorage[i].nextFrame();
					}
					else
					{
						blockStorage[i].gotoAndStop(1);
					}
				}
			}
			
			if (saveButton.hitTestPoint(mouseX, mouseY, true))
				save();
		}
		
		public function init():void
		{
			
		}
		
		public function save():void
		{
			var level:Array = [];
			
			var i:int = 0;
			for (var y:int = 0; y < 8; y++)
			{
				level.push(new Array());
				
				for (var x:int = 0; x < 10; x++) 
				{
					level[y].push(blockStorage[i].currentFrame-1);
					i++;
				}
			}
			
			Constants.saveDataObject.data.SavedLevel = level;
			Constants.saveDataObject.flush();
			Constants.saveDataObject.close();
		}
		
		public function load():void
		{
			
		}
		
		public function loop():void 
		{
			
		}
	}

}