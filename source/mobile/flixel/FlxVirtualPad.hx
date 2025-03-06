package mobile.flixel;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;
import openfl.utils.Assets;

// Lua VirtualPad
import haxe.ds.StringMap;

typedef MobileButton = FlxButton;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:MobileButton;
	public var buttonB:MobileButton;
	public var buttonC:MobileButton;
	public var buttonD:MobileButton;
	public var buttonE:MobileButton;
	public var buttonM:MobileButton;
	public var buttonP:MobileButton;
	public var buttonV:MobileButton;
	public var buttonX:MobileButton;
	public var buttonY:MobileButton;
	public var buttonZ:MobileButton;
	public var buttonF:MobileButton;
	public var buttonG:MobileButton;
	
	//Extra
    public var buttonExtra1:MobileButton;
	public var buttonExtra2:MobileButton;
	public var buttonExtra3:MobileButton;
	public var buttonExtra4:MobileButton;
    
	//DPad
	public var buttonLeft:MobileButton;
	public var buttonUp:MobileButton;
	public var buttonRight:MobileButton;
	public var buttonDown:MobileButton;

	//PAD DUO MODE
	public var buttonLeft2:MobileButton;
	public var buttonUp2:MobileButton;
	public var buttonRight2:MobileButton;
	public var buttonDown2:MobileButton;
    
	public var buttonCEUp:MobileButton;
	public var buttonCEDown:MobileButton;
	public var buttonCEG:MobileButton;
	
	public var buttonsString:Map<String, MobileButton>;
	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;
	
	/**
	 * Create a gamepad.
	 *
	 * @param   DPadMode     The D-Pad mode. `LEFT_FULL` for example.
	 * @param   ActionMode   The action buttons mode. `A_B_C` for example.
	 */

	public function new(DPad:FlxDPadMode, Action:FlxActionMode) {
		super();
		
		#if HXVIRTUALPAD_ALLOWED
    	// DPad Buttons
    	buttonsString = new Map<String, MobileButton>();
    	buttonsString.set("buttonLeft", buttonLeft);
    	buttonsString.set("buttonUp", buttonUp);
    	buttonsString.set("buttonRight", buttonRight);
    	buttonsString.set("buttonDown", buttonDown);
    		
    	// Actions buttons
    	buttonsString.set("buttonA", buttonA);
    	buttonsString.set("buttonB", buttonB);
    	buttonsString.set("buttonC", buttonC);
    	buttonsString.set("buttonD", buttonD);
    	buttonsString.set("buttonE", buttonE);
    	buttonsString.set("buttonM", buttonM);
    	buttonsString.set("buttonP", buttonP);
    	buttonsString.set("buttonV", buttonV);
    	buttonsString.set("buttonX", buttonX);
    	buttonsString.set("buttonY", buttonY);
    	buttonsString.set("buttonZ", buttonZ);
    	buttonsString.set("buttonF", buttonF);
    	buttonsString.set("buttonG", buttonG);
    		
    	//Extras
    	buttonsString.set("buttonExtra1", buttonExtra1);
    	buttonsString.set("buttonExtra2", buttonExtra2);
    	buttonsString.set("buttonExtra3", buttonExtra3);
    	buttonsString.set("buttonExtra4", buttonExtra4);
    		
    	//PAD DUO MODE
    	buttonsString.set("buttonLeft2", buttonLeft2);
    	buttonsString.set("buttonUp2", buttonUp2);
    	buttonsString.set("buttonRight2", buttonRight2);
    	buttonsString.set("buttonDown2", buttonDown2);
    	
    	buttonsString.set("buttonCEUp", buttonCEUp);
    	buttonsString.set("buttonCEDown", buttonCEDown);
    	buttonsString.set("buttonCEG", buttonCEG);
    	#end

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();

		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();

        buttonA = new MobileButton(0, 0);
    	buttonB = new MobileButton(0, 0);
    	buttonC = new MobileButton(0, 0);
    	buttonD = new MobileButton(0, 0);
    	buttonE = new MobileButton(0, 0);
    	buttonM = new MobileButton(0, 0);
    	buttonP = new MobileButton(0, 0);
    	buttonV = new MobileButton(0, 0);
    	buttonX = new MobileButton(0, 0);
    	buttonY = new MobileButton(0, 0);
    	buttonZ = new MobileButton(0, 0);
    
    	buttonLeft = new MobileButton(0, 0);
    	buttonUp = new MobileButton(0, 0);
    	buttonRight = new MobileButton(0, 0);
    	buttonDown = new MobileButton(0, 0);
    
    	buttonLeft2 = new MobileButton(0, 0);
    	buttonUp2 = new MobileButton(0, 0);
    	buttonRight2 = new MobileButton(0, 0);
    	buttonDown2 = new MobileButton(0, 0);
            
    	buttonCEUp = new MobileButton(0, 0);
    	buttonCEDown = new MobileButton(0, 0);
    	buttonCEG = new MobileButton(0, 0);
		
		switch (DPad){
			case UP_DOWN:
				dPad.add(add(buttonUp = createMobileButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createMobileButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createMobileButton(0, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(42 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createMobileButton(35 * 3, FlxG.height - 81 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createMobileButton(0, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(69 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case FULL:
				dPad.add(add(buttonUp = createMobileButton(35 * 3, FlxG.height - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createMobileButton(0, FlxG.height - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(69 * 3, FlxG.height - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createMobileButton(35 * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
			case ChartingStateC:
			    dPad.add(add(buttonUp = createMobileButton(0, FlxG.height - 85 * 3, 'up', 0xFF12FA05)));
				dPad.add(add(buttonLeft = createMobileButton(132, FlxG.height - 85 * 3, 'left', 0xFFC24B99)));
				dPad.add(add(buttonRight = createMobileButton(132, FlxG.height - 45 * 3, 'right', 0xFFF9393F)));
				dPad.add(add(buttonDown = createMobileButton(0, FlxG.height - 45 * 3, 'down', 0xFF00FFFF)));
			case OptionsC:
			    dPad.add(add(buttonUp = createMobileButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createMobileButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
			case RIGHT_FULL:
				dPad.add(add(buttonUp = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, "down", 0x00FFFF)));
			case DUO:
				dPad.add(add(buttonUp = createMobileButton(35 * 3, FlxG.height - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createMobileButton(0, FlxG.height - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(69 * 3, FlxG.height - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createMobileButton(35 * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonUp2 = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft2 = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown2 = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, "down", 0x00FFFF)));
			case PAUSE:	
				dPad.add(add(buttonUp = createMobileButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createMobileButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createMobileButton(42 * 3, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createMobileButton(84 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case NONE:
		}

		switch (Action){
		    case E:
				actions.add(add(buttonE = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, "modding", -1)));
			case A:
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case B:
				actions.add(add(buttonB = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case A_B:
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case A_B_C:
				actions.add(add(buttonC = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_E:
				actions.add(add(buttonE = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_E_C_M:
			    actions.add(add(buttonM = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "m", 0xFFCB00)));
				actions.add(add(buttonE = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			    actions.add(add(buttonC = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, "c", 0x44FF00)));
 			case A_B_X_Y:
				actions.add(add(buttonY = createMobileButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case B_X_Y:
				actions.add(add(buttonY = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case A_B_C_X_Y_Z:
				actions.add(add(buttonX = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonY = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonC = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case FULL:
				actions.add(add(buttonV = createMobileButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, "v", 0x49A9B2)));
				actions.add(add(buttonX = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonY = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonD = createMobileButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "d", 0x0078FF)));
				actions.add(add(buttonC = createMobileButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
		    case OptionsC:
			    actions.add(add(buttonLeft = createMobileButton(FlxG.width - 258, FlxG.height - 85 * 3, "left", 0xFF00FF)));
				actions.add(add(buttonRight = createMobileButton(FlxG.width - 132, FlxG.height - 85 * 3, "right", 0xFF0000)));
			    actions.add(add(buttonC = createMobileButton(FlxG.width - 384, FlxG.height - 135, 'c', 0x44FF00)));
			    actions.add(add(buttonB = createMobileButton(FlxG.width - 258, FlxG.height - 135, 'b', 0xFFCB00)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 132, FlxG.height - 135, 'a', 0xFF0000)));
			case ChartingStateC:
			    actions.add(add(buttonG = createMobileButton(FlxG.width - (44 + 42 * 1) * 3, 25, 'g', 0x49A9B2)));
			    actions.add(add(buttonP = createMobileButton(FlxG.width - 636, FlxG.height - 255, 'up', 0x49A9B2)));
			    actions.add(add(buttonE = createMobileButton(FlxG.width - 636, FlxG.height - 135, 'down', 0x49A9B2)));
				actions.add(add(buttonV = createMobileButton(FlxG.width - 510, FlxG.height - 255, 'v', 0x49A9B2)));
				actions.add(add(buttonD = createMobileButton(FlxG.width - 510, FlxG.height - 135, 'd', 0x0078FF)));
				actions.add(add(buttonX = createMobileButton(FlxG.width - 384, FlxG.height - 255, 'x', 0x99062D)));
				actions.add(add(buttonC = createMobileButton(FlxG.width - 384, FlxG.height - 135, 'c', 0x44FF00)));
				actions.add(add(buttonY = createMobileButton(FlxG.width - 258, FlxG.height - 255, 'y', 0x4A35B9)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 258, FlxG.height - 135, 'b', 0xFFCB00)));
				actions.add(add(buttonZ = createMobileButton(FlxG.width - 132, FlxG.height - 255, 'z', 0xCCB98E)));
				actions.add(add(buttonA = createMobileButton(FlxG.width - 132, FlxG.height - 135, 'a', 0xFF0000)));
				
			case controlExtend:
			    if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 1) actions.add(add(buttonExtra1 = createMobileButton(FlxG.width * 0.5 - 44 * 3, FlxG.height * 0.5 - 127 * 0.5, "f", 0xFF0000)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 2) actions.add(add(buttonExtra2 = createMobileButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "g", 0xFFFF00)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 3) actions.add(add(buttonExtra3 = createMobileButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "x", 0x99062D)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 4) actions.add(add(buttonExtra4 = createMobileButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "y", 0x4A35B9)));
			case B_E:
				actions.add(add(buttonE = createMobileButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createMobileButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case NONE:
		}
	}
	
	public function createMobileButton(x:Float, y:Float, Frames:String, ColorS:Int):Dynamic
	{
	    return createButton(x, y, Frames, ColorS);
	}
	
	public function createButton(x:Float, y:Float, Frames:String, ?ColorS:Int = 0xFFFFFF):FlxButton {
	    var frames:FlxGraphic;

		final path:String = 'shared:assets/shared/images/virtualpad/original/$Frames.png';
		if(Assets.exists(path))
			frames = FlxGraphic.fromBitmapData(Assets.getBitmapData(path));
		else
			frames = FlxGraphic.fromBitmapData(Assets.getBitmapData('shared:assets/shared/images/virtualpad/original/default.png'));

		var button:FlxButton = new FlxButton(x, y);
		button.frames = FlxTileFrames.fromGraphic(frames, FlxPoint.get(Std.int(frames.width / 2), frames.height));
		button.solid = false;
		button.immovable = true;
		button.moves = false;
		button.scrollFactor.set();
		if (ColorS != -1) button.color = ColorS;
		button.antialiasing = ClientPrefs.globalAntialiasing;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}
	
	override public function destroy():Void
	{
		super.destroy();
		for (field in Reflect.fields(this))
			if (Std.isOfType(Reflect.field(this, field), MobileButton))
				Reflect.setField(this, field, FlxDestroyUtil.destroy(Reflect.field(this, field)));
	}
}