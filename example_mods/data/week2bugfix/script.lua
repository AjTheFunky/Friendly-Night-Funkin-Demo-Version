function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('labc', 'camHud')
                scaleObject('labc', 1280/2950, 720/2000)
	        addLuaSprite('labc', true)
		startDialogue('purgatory/dialogue', '');
                playMusic('scratchcutscene', 0.5, true)   
		playSound('voices/week0/lexil8', 1, 'lexil8') 
	end
	if tag == 'fuck' then -- Timer completed, play dialogue
        loadSong('purgatory');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('lexil8')
		playSound('voices/week0/aokil8', 1, 'aokil8') 	
	elseif count == 2 then 
		stopSound('aokil8')
		playSound('voices/week0/aokil9', 1, 'aokil9') 	
	elseif count == 3 then
		stopSound('aokil9')
		playSound('voices/week0/lexil9', 1, 'lexil9') 	
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	if count == 9 then
		stopSound('lexil9')
        	runTimer('fuck', 7);
        end
end

function onCreate()
	setProperty('CountOne.visible', false)
	setProperty('CountTwo.visible', false)
	setProperty('CountThree.visible', false)
	setProperty('CountGO.visible', false)
end

function onPause()
	return Function_Stop
end