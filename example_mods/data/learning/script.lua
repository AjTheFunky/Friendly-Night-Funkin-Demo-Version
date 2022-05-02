local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
		allowCountdown = true;
		return Function_Stop;
	end
        removeLuaSprite('lexiroom')
        runTimer('arrows', 0.01);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('lexiroom', 'camHud')
                scaleObject('lexiroom', 1280/2950, 720/2000)
	        addLuaSprite('lexiroom', true)
		startDialogue('dialogue', '');
                playMusic('tea-time', 0.5, true)   
		playSound('voices/week0/lexil1', 1, 'lexil1') 
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('lexil1')
	elseif count == 2 then 
                musicFadeOut('tea-time', 0.01, 0)
		playMusic('aokiringtone', 0.3, true)
	elseif count == 3 then
		musicFadeOut('aokiringtone', 0.01, 0)
                playMusic('tea-time', 0.5, true)
		playSound('voices/phone1', 1, 'phone1') 
	elseif count == 4 then
		stopSound('phone1')
		playSound('voices/week0/aokil1', 1, 'aokil1') 	
	elseif count == 5 then
		stopSound('aokil1')
		playSound('voices/phone2', 1, 'phone2') 
	elseif count == 6 then
		stopSound('phone2')
		playSound('voices/week0/aokil2', 1, 'aokil2') 
	elseif count == 7 then		
		stopSound('aokil2')
		playSound('voices/phone3', 1, 'phone3') 
	elseif count == 8 then
		stopSound('phone3')
		playSound('voices/week0/aokil3', 1, 'aokil3')
	elseif count == 9 then		
		stopSound('aokil3')
		playSound('voices/phonebye', 1, 'phonebye') 
	elseif count == 10 then
		stopSound('phonebye')
	elseif count == 11 then
		playSound('voices/week0/aokil4', 1, 'aokil4')
	elseif count == 12 then
		stopSound('aokil4')
		playSound('voices/week0/lexil2', 1, 'lexil2')
	elseif count == 13 then
		stopSound('lexil2')
		playSound('voices/week0/lexil3', 1, 'lexil3')
	elseif count == 14 then
		stopSound('lexil3')
		playSound('voices/week0/aokil5', 1, 'aokil5')
	elseif count == 15 then
		stopSound('aokil5')
		playSound('voices/week0/lexil4', 1, 'lexil4')
	elseif count == 16 then
		stopSound('lexil4')
		playSound('voices/week0/lexil5', 1, 'lexil5')
	elseif count == 16 then
		stopSound('lexil5')
	elseif count == 17 then
		stopSound('lexil5')
	elseif count == 18 then
		playSound('voices/week0/lexil6', 1, 'lexil6')
	elseif count == 19 then
		stopSound('lexil6')
		playSound('voices/week0/aokil6', 1, 'aokil6')
	elseif count == 20 then
		stopSound('aokil6')
		playSound('voices/week0/aokil7', 1, 'aokil7')
	elseif count == 21 then
		stopSound('aokil7')
		playSound('voices/week0/lexil7', 1, 'lexil7')
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('lexil7')
end

function onEndSong()
        loadSong('learningendcutscene');
        return Function_Stop;
end