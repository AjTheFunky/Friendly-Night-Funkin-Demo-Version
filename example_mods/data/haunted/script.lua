function onCreatePost()
        makeAnimatedLuaSprite('Aiden', 'characters/HeDiedFirst', -70, 0);
        addAnimationByPrefix('Aiden','idle','aidenidle',24,false)
        addLuaSprite('Aiden', true);
end
function onBeatHit()
        if curBeat % 2 == 0 then --if even beat
            objectPlayAnimation('Aiden','idle',false)
        end 
end

local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
		allowCountdown = true;
		return Function_Stop;
	end
        removeLuaSprite('rd')
        runTimer('arrows', 0.01);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('rd', 'camHud')
                scaleObject('rd', 1280/2950, 720/2000)
	        addLuaSprite('rd', true)
		startDialogue('dialogue', '');
                playMusic('ghostcutscene', 0.5, true)   
		playSound('voices/week2/song1/aokil1', 1, 'aokil1') 
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('aokil1')
		--playSound('voices/week1/song1/scratchl1', 1, 'scratchl1') 
	elseif count == 2 then 
		stopSound('scratchl1')
		--playSound('voices/week1/song1/lexil1', 1, 'lexil1') 
	elseif count == 3 then
		stopSound('lexil1')
		--playSound('voices/week1/song1/scratchl2', 1, 'scratchl2') 
	elseif count == 4 then
		stopSound('scratchl2')
		--playSound('voices/week1/song1/scratchl3', 1, 'scratchl3') 	
	elseif count == 5 then
		stopSound('scratchl3')
		--playSound('voices/week1/song1/aokil2', 1, 'aokil2') 
	elseif count == 6 then
		stopSound('aokil2')
	elseif count == 7 then		

	elseif count == 8 then
		--playSound('voices/week1/song1/lexil2', 1, 'lexil2') 
	elseif count == 9 then
		stopSound('lexil2')
		--playSound('voices/week1/song1/aokil3', 1, 'aokil3') 
	elseif count == 10 then
		stopSound('aokil3')
		--playSound('voices/week1/song1/scratchl4', 1, 'scratchl4') 
	elseif count == 11 then		
		stopSound('scratchl4')
		--playSound('voices/week1/song1/lexil3', 1, 'lexil3') 
	elseif count == 12 then
		stopSound('lexil3')
		--playSound('voices/week1/song1/lexil4', 1, 'lexil4') 
	elseif count == 13 then
		stopSound('lexil4')
		--playSound('voices/week1/song1/scratchl5', 1, 'scratchl5') 
	elseif count == 14 then
		stopSound('scratchl5')
		--playSound('voices/week1/song1/lexil5', 1, 'lexil5') 
	elseif count == 15 then
		stopSound('lexil5')
		--playSound('voices/week1/song1/scratchl6', 1, 'scratchl6') 
	elseif count == 16 then
		stopSound('scratchl6')
		--playSound('voices/week1/song1/axell1', 1, 'axell1') 
	elseif count == 17 then
		stopSound('axell1')
		--playSound('voices/week1/song1/scratchl7', 1, 'scratchl7') 
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('scratchl7')
end