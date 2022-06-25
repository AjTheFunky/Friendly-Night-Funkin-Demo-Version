local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('labc', 'camHud')
                scaleObject('labc', 1280/2950, 720/2000)
	        addLuaSprite('labc', true)
		startDialogue('dialogue', '');
                playMusic('scratchcutscene', 0.5, true)   
		playSound('voices/week1/songend/0', 1, '0') 
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('0')
		playSound('voices/week1/songend/1', 1, '1') 
	elseif count == 2 then 
		stopSound('1')
		playSound('voices/week1/songend/2', 1, '2') 
	elseif count == 3 then
		stopSound('2')
		playSound('voices/week1/songend/3', 1, '3') 
	elseif count == 4 then
		stopSound('3')
		playSound('voices/week1/songend/4', 1, '4')
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('4')
end

function onCreate()
	setProperty('CountOne.visible', false)
	setProperty('CountTwo.visible', false)
	setProperty('CountThree.visible', false)
	setProperty('CountGO.visible', false)
end

function onCreatePost()
	if not isStoryMode then
		runTimer('endcutscene', 0.1);
	end
end

function onCountdownTick(counter)
	if counter == 0 then --Three
		runTimer('endcutscene', 0.1);
	end
end