function onCreate()
	-- background shit
	makeLuaSprite('room_dark', 'stages/room_dark', -700, -500);
	setScrollFactor('room_dark', 1, 1);
	scaleObject('room_dark', 1.6, 1.6)
	updateHitbox('room_dark')
	addLuaSprite('room_dark', false);
	precacheSound('thunder_1')
	precacheSound('thunder_2')
        makeLuaSprite('flash', 'flash', 0, 0);
	setScrollFactor('flash', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('flash.scale.x', 1 / defaultCamZoom);
	setProperty('flash.scale.y', 1 / defaultCamZoom);
	setProperty('flash.alpha', 0.0001);
end

function onSongStart()
    addLuaSprite('flash', true);
end

local lightningStrikeBeat = 0
local lightningOffset = 8
function onBeatHit()
        boom = getRandomInt(1,20)
        --debugPrint(boom)
	if boom == 20 and songName ~= 'Grape-Boy' and songName ~= 'week2bugfix' then
		--triggerEvent('Lightning',0.5,0.5);
        setProperty('flash.alpha', 0.5);
	soundName = string.format('thunder_%i', getRandomInt(1, 2));
	playSound(soundName, 1, 'thundah');
	characterPlayAnim('boyfriend', 'scared', true);
                characterPlayAnim('gf', 'scared', true);
		doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 0.5, 'linear');
	if cameraZoomOnBeat then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		
		if not getProperty('camZooming') then
			doTweenZoom('cG', 'camGame', getProperty('defaultCamZoom'), 0.5, 'linear')
			doTweenZoom('cH', 'camHUD', 1, 0.5, 'linear')
		end
	end
	end
end

function lightningStrikeShit()
	lightningStrikeBeat = curBeat
	lightningOffset = getRandomInt(8, 24)
	triggerEvent('Lightning','','');
	soundName = string.format('thunder_%i', getRandomInt(1, 2));
	playSound(soundName, 1, 'thundah');
	characterPlayAnim('gf', 'scared');
	characterPlayAnim('boyfriend', 'scared');
	if cameraZoomOnBeat then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		
		if not getProperty('camZooming') then
			doTweenZoom('cG', 'camGame', getProperty('defaultCamZoom'), 0.5, 'linear')
			doTweenZoom('cH', 'camHUD', 1, 0.5, 'linear')
		end
	end
end