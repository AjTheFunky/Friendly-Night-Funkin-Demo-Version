local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
		allowCountdown = true;
		return Function_Stop;
	end
        removeLuaSprite('labc')
        runTimer('arrows', 0.01);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('labc', 'camHud')
                scaleObject('labc', 1280/2950, 720/2000)
	        addLuaSprite('labc', true)
		startDialogue('dialogue', '');
                playMusic('scratchcutscene', 0.5, true)   
		playSound('voices/week1/song2/0', 1, '0') 
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('0')
		playSound('voices/week1/song2/1', 1, '1') 
	elseif count == 2 then 
		stopSound('1')
		playSound('voices/week1/song2/2', 1, '2') 
	elseif count == 3 then
		stopSound('2')
		playSound('voices/week1/song2/3', 1, '3') 
	elseif count == 4 then
		stopSound('3')
		playSound('voices/week1/song2/4', 1, '4') 	
	elseif count == 5 then
		stopSound('4')
		playSound('voices/week1/song2/5', 1, '5') 
	elseif count == 6 then
		stopSound('5')
		playSound('voices/week1/song2/6', 1, '6') 
	elseif count == 7 then		
		stopSound('6')
		playSound('voices/week1/song2/7', 1, '7') 

	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('7')
end