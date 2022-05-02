function onCreatePost()
	makeLuaSprite('flash', 'flash', 0, 0);
	setScrollFactor('flash', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('flash.scale.x', 1 / defaultCamZoom);
	setProperty('flash.scale.y', 1 / defaultCamZoom);
	setProperty('flash.alpha', 0.0001);
	addLuaSprite('flash', true);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Lightning" then
		setProperty('flash.alpha', 0.5);
		playSound('thunder_1', 2);
                characterPlayAnim('boyfriend', 'scared', true);
		setProperty('boyfriend.specialAnim', true);
                characterPlayAnim('gf', 'scared', true);
		setProperty('gf.specialAnim', true);
		doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 0.5, 'linear');
	end
end
