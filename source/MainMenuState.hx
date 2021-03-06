package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.5.2h'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;
	var showCharacter:FlxSprite = null;
	var showCharacter2:FlxSprite = null;
	var showCharacter3:FlxSprite = null;
	var showCharacter4:FlxSprite = null;
	var showCharacter5:FlxSprite = null;
	var showCharacter6:FlxSprite = null;
	var showCharacter7:FlxSprite = null;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var menuItems2:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		#if MODS_ALLOWED 'mods', #end
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		#if !switch 'donate', #end
		'options'
	];

	var optionShit2:Array<String> = [
		'story_mode',
		'freeplay',
		#if MODS_ALLOWED 'mods', #end
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		#if !switch 'donate', #end
		'options'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		//bg.scrollFactor.set(1, 1);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		//magenta.scrollFactor.set(1, 1);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);
		menuItems2 = new FlxTypedGroup<FlxSprite>();
		add(menuItems2);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(100, 50 + (i * 150)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}

		//for (i in 0...optionShit2.length)
		//{
		//	var offset2:Float = 108 - (Math.max(optionShit2.length, 4) - 4) * 80;
		//	var menuItem2:FlxSprite = new FlxSprite(800, 300 + (i + offset2));
		//	menuItem2.scale.x = scale;
		//	menuItem2.scale.y = scale;
		//	menuItem2.frames = Paths.getSparrowAtlas('mainmenu2/menu_' + optionShit[i]);
		//	menuItem2.animation.addByPrefix('idle', optionShit[i] + " white", 24);
		//	menuItem2.animation.play('idle');
		//	menuItem2.ID = i;
		//	menuItem2.screenCenter(X);
		//	menuItems2.add(menuItem2);
		//	var scr:Float = (optionShit2.length - 4) * 0.135;
		//	if(optionShit2.length < 6) scr = 0;
		//	menuItem2.scrollFactor.set(0, scr);
		//	menuItem2.antialiasing = ClientPrefs.globalAntialiasing;
		//	menuItem2.setGraphicSize(Std.int(menuItem2.width * 0.58));
		//	menuItem2.updateHitbox();
		//}

		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// avoids lagspikes while scrolling through menus!
		showCharacter = new FlxSprite(700, 200);
		//showCharacter.screenCenter(X);
		showCharacter.scrollFactor.set(0, 0);
	    showCharacter.frames = Paths.getSparrowAtlas('mainmenu2/menu_story_mode');
		showCharacter.animation.addByPrefix('idle', "story_mode white", 24);
		showCharacter.animation.play('idle');
		showCharacter.setGraphicSize(Std.int(showCharacter.width * 0.6));
		showCharacter.updateHitbox();
		showCharacter.visible = false;
		showCharacter.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter);

		showCharacter2 = new FlxSprite(900, 300);
		//showCharacter2.screenCenter(X);
		showCharacter2.scrollFactor.set(0, 0);
	    showCharacter2.frames = Paths.getSparrowAtlas('mainmenu2/menu_freeplay');
		showCharacter2.animation.addByPrefix('idle', "freeplay white", 24);
		showCharacter2.animation.play('idle');
		showCharacter2.setGraphicSize(Std.int(showCharacter2.width * 0.6));
		showCharacter2.updateHitbox();
		showCharacter2.visible = false;
		showCharacter2.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter2);

		showCharacter3 = new FlxSprite(625, 150);
		//showCharacter3.screenCenter(X);
		showCharacter3.scrollFactor.set(0, 0);
	    showCharacter3.frames = Paths.getSparrowAtlas('mainmenu2/menu_mods');
		showCharacter3.animation.addByPrefix('idle', "mods white", 24);
		showCharacter3.animation.play('idle');
		showCharacter3.setGraphicSize(Std.int(showCharacter3.width * 0.6));
		showCharacter3.updateHitbox();
		showCharacter3.visible = false;
		showCharacter3.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter3);

		showCharacter4 = new FlxSprite(650, 175);
		//showCharacter4.screenCenter(X);
		showCharacter4.scrollFactor.set(0, 0);
	    showCharacter4.frames = Paths.getSparrowAtlas('mainmenu2/menu_awards');
		showCharacter4.animation.addByPrefix('idle', "awards white", 24);
		showCharacter4.animation.play('idle');
		showCharacter4.setGraphicSize(Std.int(showCharacter4.width * 0.6));
		showCharacter4.updateHitbox();
		showCharacter4.visible = false;
		showCharacter4.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter4);

		showCharacter5 = new FlxSprite(800, 200);
		//showCharacter5.screenCenter(X);
		showCharacter5.scrollFactor.set(0, 0);
	    showCharacter5.frames = Paths.getSparrowAtlas('mainmenu2/menu_credits');
		showCharacter5.animation.addByPrefix('idle', "credits white", 24);
		showCharacter5.animation.play('idle');
		showCharacter5.setGraphicSize(Std.int(showCharacter5.width * 0.6));
		showCharacter5.updateHitbox();
		showCharacter5.visible = false;
		showCharacter5.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter5);

		showCharacter6 = new FlxSprite(800, 250);
		//showCharacter6.screenCenter(X);
		showCharacter6.scrollFactor.set(0, 0);
	    showCharacter6.frames = Paths.getSparrowAtlas('mainmenu2/menu_donate');
		showCharacter6.animation.addByPrefix('idle', "donate white", 24);
		showCharacter6.animation.play('idle');
		showCharacter6.setGraphicSize(Std.int(showCharacter6.width * 0.6));
		showCharacter6.updateHitbox();
		showCharacter6.visible = false;
		showCharacter6.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter6);

		showCharacter7 = new FlxSprite(600, 150);
		//showCharacter7.screenCenter(X);
		showCharacter7.scrollFactor.set(0, 0);
	    showCharacter7.frames = Paths.getSparrowAtlas('mainmenu2/menu_options');
		showCharacter7.animation.addByPrefix('idle', "options white", 24);
		showCharacter7.animation.play('idle');
		showCharacter7.setGraphicSize(Std.int(showCharacter7.width * 0.6));
		showCharacter7.updateHitbox();
		showCharacter7.visible = false;
		showCharacter7.antialiasing = ClientPrefs.globalAntialiasing;
		add(showCharacter7);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	

		public function new()
	{
		super();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{

		//if(showCharacter != null) {
		//		showCharacter.alpha = 0;
		//	}
		//if(showCharacter != null && showCharacter.animation.curAnim.finished) {
		//	showCharacter.animation.play('idle');
		//}
		switch (optionShit[curSelected])    
{            
            case 'story_mode': 
			        showCharacter7.visible = false;
                    showCharacter.visible = true;
					showCharacter2.visible = false;
			case 'freeplay': 
                    showCharacter.visible = false;
					showCharacter2.visible = true;
					showCharacter3.visible = false;
			case 'mods': 
                    showCharacter2.visible = false;
					showCharacter3.visible = true;
					showCharacter4.visible = false;
			case 'awards': 
                    showCharacter3.visible = false;
					showCharacter4.visible = true;
					showCharacter5.visible = false;
			case 'credits': 
                    showCharacter4.visible = false;
					showCharacter5.visible = true;
					showCharacter6.visible = false;
			case 'donate': 
                    showCharacter5.visible = false;
					showCharacter6.visible = true;
					showCharacter7.visible = false;
			case 'options': 
                    showCharacter6.visible = false;
					showCharacter7.visible = true;
					showCharacter.visible = false;
}
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 2);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];
								var daChoice2:String = optionShit2[curSelected];

								switch (daChoice)
								{
						            case 'story_mode':
							            MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		//menuItems2.forEach(function(spr:FlxSprite)
		//{
		//	spr.screenCenter(X);
		//});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y + add);
				spr.centerOffsets();
			}
		});
	}
}
