function onCreate()
	-- background shit
	makeLuaSprite('room', 'stages/room', -700, -500);
	setScrollFactor('room', 1, 1);
	scaleObject('room', 1.6, 1.6)
	updateHitbox('room')

	addLuaSprite('room', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end