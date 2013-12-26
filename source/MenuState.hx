package;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var trailRenderer:FlxTrailRenderer;
	var emitter:FlxEmitter;
	var particleAmount:Int = 100;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		trailRenderer = new FlxTrailRenderer();
		
		emitter = new FlxEmitter(0, 0, particleAmount);
		
		var particle:FlxParticle;
		var i:Int = 0;
		while (i < particleAmount) {
			particle = new FlxParticle();
			particle.makeGraphic(2, 2);
			particle.kill();
			emitter.add(particle);
			trailRenderer.add(particle);
			i++;
		}
		add(emitter);
		add(trailRenderer);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		if (FlxG.mouse.justPressed) {
			emitter.x = FlxG.mouse.x;
			emitter.y = FlxG.mouse.y;
			emitter.start(true, 1, 0, 0, 0.5);
		}
	}	
}