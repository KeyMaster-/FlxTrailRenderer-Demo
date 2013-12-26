package ;
import flash.display.BitmapData;
import flash.geom.ColorTransform;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
class FlxTrailRenderer_ extends FlxSpriteGroup{
	public var renderSprite:FlxSprite;
	public var renderBitmap:BitmapData;
	public function new() {
		super();
		renderSprite = new FlxSprite();
		renderSprite.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
		renderBitmap = new BitmapData(FlxG.width, FlxG.height, 0xFF000000);
	}
	
	override public function draw():Void 
	{
		//Fade out the bitmap
		//TODO Add fade out speed variable (alpha multiplier
		var cTrans:ColorTransform = new ColorTransform(1, 1, 1, 0.8);
		renderBitmap.colorTransform(new Rectangle(0, 0, renderBitmap.width, renderBitmap.height), cTrans);
		
		var i:Int = 0;
		while (i < group.members.length) {
			renderBitmap.copyPixels(group.members[i].pixels, new Rectangle(0, 0, group.members[i].frameWidth, group.members[i].frameHeight), new Point(group.members[i].x, group.members[i].y), null, null, true);
			i++;
		}
		renderSprite.pixels = renderBitmap;
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
	
}