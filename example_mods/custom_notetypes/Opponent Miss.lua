function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Opponent Miss' then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Change texture
		end
	end
	makeAnimatedLuaSprite('fakeN0', 'NOTE_assets', defaultOpponentStrumX0, defaultOpponentStrumY0 + 10)
	makeAnimatedLuaSprite('fakeN1', 'NOTE_assets', defaultOpponentStrumX1 - 3, defaultOpponentStrumY1 + 10)
	makeAnimatedLuaSprite('fakeN2', 'NOTE_assets', defaultOpponentStrumX2 - 4.1, defaultOpponentStrumY2 + 8)
	makeAnimatedLuaSprite('fakeN3', 'NOTE_assets', defaultOpponentStrumX3, defaultOpponentStrumY3 + 7)
	addAnimationByPrefix('fakeN0', '0', 'left press', 24, false)
	addAnimationByPrefix('fakeN1', '1', 'down press', 24, false)
	addAnimationByPrefix('fakeN2', '2', 'up press', 24, false)
	addAnimationByPrefix('fakeN3', '3', 'right press', 24, false)
	
	for i = 0, 3 do
		setProperty('fakeN'..i..'.visible', false)
		setObjectCamera('fakeN'..i, 'hud')
		addLuaSprite('fakeN'..i, false)
		scaleObject('fakeN'..i, 0.75, 0.75)
	end
end

local DadSingAnims = {'singLEFTmiss', 'singDOWNmiss', 'singUPmiss', 'singRIGHTmiss'} 
local DadSingDir = 1
function onUpdatePost(elapsed)
    for a = 0, getProperty('notes.length') - 1 do
        noteData = getPropertyFromGroup('notes', a, 'noteData')
		noteType = getPropertyFromGroup('notes', a, 'noteType')
		strumTime = getPropertyFromGroup('notes', a, 'strumTime')
		mustPress = getPropertyFromGroup('notes', a, 'mustPress')
		if noteType == 'Opponent Miss' and not mustPress then
			if (strumTime - getSongPosition()) < 1 and getPropertyFromGroup('notes', a, 'active') then
				DadSingDir = noteData
				setPropertyFromGroup('notes', a, 'active', false)
				setProperty('vocals.volume', 0)
				soundName = string.format('missnote%i', math.random(1, 3));
				playSound(soundName, getRandomFloat(0.1, 0.2), 'OPMiss');
				characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
				setProperty('dad.specialAnim', true)
				fakeNote(noteData)
			end
			if (strumTime - getSongPosition()) < -300 / getProperty('songSpeed') then
				setPropertyFromGroup('opponentStrums', noteData, 'visible', true)
				setProperty('fakeN'..noteData..'.visible', false)
			end
		end
	end
end

function fakeNote(note)
	setPropertyFromGroup('opponentStrums', note, 'visible', false)
	setProperty('fakeN'..note..'.visible', true)
	objectPlayAnimation('fakeN'..note, note, false)
end
		