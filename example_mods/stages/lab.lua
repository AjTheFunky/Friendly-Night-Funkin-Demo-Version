function onCreate()
	-- background shit
	makeLuaSprite('lab', 'stages/lab', -700, -500);
	setScrollFactor('lab', 1, 1);
	scaleObject('lab', 1.6, 1.6)
	updateHitbox('lab')

	addLuaSprite('lab', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end