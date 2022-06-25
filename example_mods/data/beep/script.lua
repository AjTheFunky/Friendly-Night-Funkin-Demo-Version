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
		playSound('voices/week1/song1/0', 1, '0') 
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('0')
		playSound('voices/week1/song1/1', 1, '1') 
	elseif count == 2 then 
		stopSound('1')
		playSound('voices/week1/song1/2', 1, '2') 
	elseif count == 3 then
		stopSound('2')
		playSound('voices/week1/song1/3', 1, '3') 
	elseif count == 4 then
		stopSound('3')
		playSound('voices/week1/song1/4', 1, '4') 	
	elseif count == 5 then
		stopSound('4')
		playSound('voices/week1/song1/5', 1, '5') 
	elseif count == 6 then
		stopSound('5')
	elseif count == 7 then		

	elseif count == 8 then
		playSound('voices/week1/song1/8', 1, '8') 
	elseif count == 9 then
		stopSound('8')
		playSound('voices/week1/song1/9', 1, '9') 
	elseif count == 10 then
		stopSound('9')
		playSound('voices/week1/song1/10', 1, '10') 
	elseif count == 11 then		
		stopSound('10')
		playSound('voices/week1/song1/11', 1, '11') 
	elseif count == 12 then
		stopSound('11')
		playSound('voices/week1/song1/12', 1, '12') 
	elseif count == 13 then
		stopSound('12')
		playSound('voices/week1/song1/13', 1, '13') 
	elseif count == 14 then
		stopSound('13')
		playSound('voices/week1/song1/14', 1, '14') 
	elseif count == 15 then
		stopSound('14')
		playSound('voices/week1/song1/15', 1, '15') 
	elseif count == 16 then
		stopSound('15')
		playSound('voices/week1/song1/16', 1, '16') 
	elseif count == 17 then
		stopSound('16')
		playSound('voices/week1/song1/17', 1, '17') 
	elseif count == 17 then
		stopSound('17')
		playSound('voices/week1/song1/18', 1, '18')
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('18')
end