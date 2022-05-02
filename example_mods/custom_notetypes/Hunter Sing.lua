function onCreatePost(tag)
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hunter Sing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --No Anim
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                        setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/hunter'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function onEvent( name, value1,value2)
	if name == "dad2sing" then

		if value1 == 0 then
			objectPlayAnimation('Hunter','singLEFT',true)
		end
		if value1 == 1 then
			objectPlayAnimation('Hunter','singDOWN',true)
		end
		if value1 == 2 then
			objectPlayAnimation('Hunter','singUP',true)
		end
		if value1 == 3 then
			objectPlayAnimation('Hunter','singRIGHT',true)
		end
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)

	if noteType == 'Hunter Sing' then
		triggerEvent("dad2sing",noteData,'')
	end
end