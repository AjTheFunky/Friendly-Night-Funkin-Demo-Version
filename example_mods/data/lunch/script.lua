local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.1);
		allowCountdown = true;
		return Function_Stop;
	end
        removeLuaSprite('food')
        runTimer('arrows', 0.01);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
	        setObjectCamera('black', 'camHud')
                scaleObject('black', 1280/2950, 720/2000)
	        addLuaSprite('black', true)
		startDialogue('dialogue', '');
                playMusic('aokithemesick', 0.5, true)   
		playSound('voices/week3/song1/0', 1, '0') 
	end
        if tag == 'arrows' then
             triggerEvent('Alt Idle Animation','Dad','-alt');
        end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)

function onNextDialogue(count)
	if count == 1 then
		stopSound('0')
		playSound('voices/week3/song1/1', 1, '1') 
	elseif count == 2 then 
		stopSound('1')
		playSound('voices/week3/song1/2', 1, '2') 
	elseif count == 3 then
		stopSound('2')
		playSound('voices/week3/song1/3', 1, '3') 
	elseif count == 4 then
		stopSound('3')
		playSound('voices/week3/song1/4', 1, '4') 	
	elseif count == 5 then
		stopSound('4')
		playSound('voices/week3/song1/5', 1, '5') 
	elseif count == 6 then
		stopSound('5')
		playSound('voices/week3/song1/6', 1, '6') 
	elseif count == 7 then 
		stopSound('6')
		playSound('voices/week3/song1/7', 1, '7') 
	elseif count == 8 then
		stopSound('7')
		playSound('voices/week3/song1/8', 1, '8')
		musicFadeOut(0.5, 0)
	elseif count == 9 then
		stopSound('8')
                setObjectCamera('labc', 'camHud')
                scaleObject('labc', 1280/2950, 720/2000)
                removeLuaSprite('black')
	        addLuaSprite('labc', false)
                playMusic('scratchcutscenesad', 0.5, true)   
		playSound('voices/week3/song1/9', 1, '9') 	
	elseif count == 10 then
		stopSound('9')
		playSound('voices/week3/song1/10', 1, '10') 
	elseif count == 11 then
		stopSound('10')
		playSound('voices/week3/song1/11', 1, '11') 
	elseif count == 12 then 
		stopSound('11')
		playSound('voices/week3/song1/12', 1, '12') 
	elseif count == 13 then
		stopSound('12')
		playSound('voices/week3/song1/13', 1, '13') 
	elseif count == 14 then
		stopSound('13')
		playSound('voices/week3/song1/14', 1, '14') 	
	elseif count == 15 then
		stopSound('14')
		playSound('voices/week3/song1/15', 1, '15') 
	elseif count == 16 then
		stopSound('15')
		playSound('voices/week3/song1/16', 1, '16') 
	elseif count == 17 then 
		stopSound('16')
		playSound('voices/week3/song1/17', 1, '17') 
	elseif count == 18 then
		stopSound('17')
		playSound('voices/week3/song1/18', 1, '18') 
	elseif count == 19 then
		stopSound('18')
                setObjectCamera('out', 'camHud')
                scaleObject('out', 1280/2950, 720/2000)
                removeLuaSprite('labc')
	        addLuaSprite('out', false)
		playSound('voices/week3/song1/19', 1, '19')
		musicFadeOut(2, 0)
	elseif count == 20 then
		stopSound('19')
                playMusic('veronicatheme', 0.5, true)   
		playSound('voices/week3/song1/20', 1, '20') 
	elseif count == 21 then
		stopSound('20')
		playSound('voices/week3/song1/21', 1, '21') 
	elseif count == 22 then 
		stopSound('21')
		playSound('voices/week3/song1/22', 1, '22') 
	elseif count == 23 then
		stopSound('22')
		playSound('voices/week3/song1/23', 1, '23') 
	elseif count == 24 then
		stopSound('23')
		playSound('voices/week3/song1/24', 1, '24') 	
	elseif count == 25 then
		stopSound('24')
                setObjectCamera('food', 'camHud')
                scaleObject('food', 1280/2950, 720/2000)
                removeLuaSprite('out')
	        addLuaSprite('food', false)
		playSound('voices/week3/song1/25', 1, '25') 
	elseif count == 26 then
		stopSound('25')
		playSound('voices/week3/song1/26', 1, '26') 
	elseif count == 27 then 
		stopSound('26')
		playSound('voices/week3/song1/27', 1, '27') 
	elseif count == 28 then
		stopSound('27')
		playSound('voices/week3/song1/28', 1, '28') 
	elseif count == 29 then
		stopSound('28')
		playSound('voices/week3/song1/29', 1, '29') 	
	elseif count == 30 then
		stopSound('29')
		playSound('voices/week3/song1/30', 1, '30') 
	elseif count == 31 then
		stopSound('30')
		playSound('voices/week3/song1/31', 1, '31') 
	elseif count == 32 then 
		stopSound('31')
		playSound('voices/week3/song1/32', 1, '32') 
	elseif count == 33 then
		stopSound('32')
		playSound('voices/week3/song1/33', 1, '33') 
	elseif count == 34 then
		stopSound('33')
		playSound('voices/week3/song1/34', 1, '34') 	
	elseif count == 35 then
		stopSound('34')
		playSound('voices/week3/song1/35', 1, '35') 
	elseif count == 36 then
		stopSound('35')
		playSound('voices/week3/song1/36', 1, '36') 
	elseif count == 37 then 
		stopSound('36')
		playSound('voices/week3/song1/37', 1, '37') 
	elseif count == 38 then
		stopSound('38')
		playSound('voices/week3/song1/38', 1, '38') 
	elseif count == 39 then
		stopSound('38')
		playSound('voices/week3/song1/39', 1, '39') 	
	end
	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
		stopSound('39')
end

function onBeatHit()

    if curBeat == 192 then
    addLuaSprite('skye',false);
    elseif curBeat == 231 then
    addLuaSprite('cg',false);
    elseif curBeat == 301 then
    objectPlayAnimation('skye','clap',true);
    end

end