clicking = false
preHealth = 1

function onUpdate(elapsed)
	
	daMultiplier = 1

	if (keyPressed('space')) then
		daMultiplier = 6
	end

	if clicking then
		setProperty('health', preHealth)
	end

	if (mousePressed('right') and clicking == false) then
		preHealth = getProperty('health')
		clicking = true
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', (getPropertyFromClass('flixel.FlxG', 'sound.music.time') + 10000 * daMultiplier))	
		runTimer('clickTimer', 0.5)
	end

	if (mousePressed('left') and clicking == false) then
		preHealth = getProperty('health')
		clicking = true
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', (getPropertyFromClass('flixel.FlxG', 'sound.music.time') - 10000 * daMultiplier))
		runTimer('clickTimer', 0.5)
	end
end

function onStepHit()

end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'clickTimer'then
		clicking = false
	end
end