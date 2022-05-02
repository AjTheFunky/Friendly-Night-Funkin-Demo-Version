function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	
	if counter == 0 then --Three
		playSound('intro/intro3' .. getProperty('dad.curCharacter'), 1, 'intro3') 	
	elseif counter == 1 then --Two
		playSound('intro/intro2' .. getProperty('dad.curCharacter'), 1, 'intro2') 	
	elseif counter == 2 then --One
		playSound('intro/intro1' .. getProperty('dad.curCharacter'), 1, 'intro1') 	
	elseif counter == 3 then --Go!
		playSound('intro/introGo' .. getProperty('dad.curCharacter'), 1, 'introGo') 	
	end
end
