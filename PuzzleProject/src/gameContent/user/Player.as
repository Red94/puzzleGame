package gameContent.user 
{
	import flash.events.*;
	import gameContent.levels.Wall;
	/**
	 * ...
	 * @author Groep3
	 */
	public class Player extends MC_Player
	{
		private var currentSpeed:int;
		private var constSpeed:int;
		private var direction:int;
		
		public function Player(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
			
			constSpeed = 15;
			currentSpeed = 0;
			direction = 0;
			
			gotoAndStop(1);
			
			Constants.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function keyDown(event:KeyboardEvent):void 
		{
			var key:uint = event.keyCode;
			if (currentSpeed == 0)
			{
				switch(key) 
				{
					//up
					case 87:
						currentSpeed = constSpeed;
						direction = 270;
						gotoAndStop(1);
					break;
					//right
					case 68:
						currentSpeed = constSpeed;
						direction = 0;
						gotoAndStop(4);
					break;
					//down
					case 83:
						currentSpeed = constSpeed;
						direction = 90;
						gotoAndStop(3);
					break;
					//left
					case 65:
						currentSpeed = constSpeed;
						direction = 180;
						gotoAndStop(2);
					break;
				}
			}
		}
		
		/*private function collisionCheck():void
		{
			for (var i:int = 0; i < Constants.collision.length; i++)
			{
				if(collision.hitTestObject(Constants.collision[i].collision))
				{
					currentSpeed = 0;
				}
			}
		}*/
		
		private function collisionCheck(wall:Wall):void
		{
			if (direction == 270 && hitBox.top.hitTestObject(wall.collision))
			{ // up
				this.y = wall.y + wall.collision.height;
				currentSpeed = 0;
			}
			else if (direction == 180 && hitBox.left.hitTestObject(wall.collision))
			{ // left
				this.x = wall.x + wall.collision.width;
				currentSpeed = 0;
			}
			else if (direction == 90 && hitBox.bottom.hitTestObject(wall.collision))
			{ // down
				this.y = wall.y - hitBox.height;
				currentSpeed = 0;
			}
			else if (direction == 0 && hitBox.right.hitTestObject(wall.collision))
			{ // right
				this.x = wall.x - hitBox.width;
				currentSpeed = 0;
			}
		}
		
		public function loop():void
		{
			this.x += Math.cos(direction * (Math.PI / 180)) * currentSpeed;
			this.y += Math.sin(direction * (Math.PI / 180)) * currentSpeed;
			
			for (var i:int = 0; i < Constants.collision.length; i++)
				collisionCheck(Constants.collision[i]);
		}
		
	}

}