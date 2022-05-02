function onTimerCompleted(tag)
    if tag == 'arrows' then
        for i = 0, getProperty('opponentStrums.length') do
             setPropertyFromGroup('opponentStrums', i, 'texture', 'arrows/'.. getProperty('dad.curCharacter')); --Change texture
             setPropertyFromGroup('playerStrums', i, 'texture', 'arrows/'.. getProperty('boyfriend.curCharacter')); --Change texture
        end

        for i = 0, getProperty('unspawnNotes.length')-1 do
             setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/'.. getProperty('dad.curCharacter')); --Change texture
        end
    if getProperty('dad.curCharacter') == 'aiden' or getProperty('dad.curCharacter') == 'ghostbros' then
        for i = 0, getProperty('opponentStrums.length') do
             setPropertyFromGroup('opponentStrums', i, 'texture', 'arrows/aiden'); --Change texture
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
             setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/aiden'); --Change texture
        end
    end
        for i = 0, getProperty('unspawnNotes.length')-1 do
             if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hunter Sing' or getProperty('dad.curCharacter') == 'hunter' then
             setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/hunter'); --Change texture
        end
    end
        for i = 0, getProperty('unspawnNotes.length')-1 do
             if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Both Bros Sing' then
                 setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/ghostbros'); --Change texture
             end
        end

        for i = 0, getProperty('unspawnNotes.length')-1 do
            if  getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'arrows/'.. getProperty('boyfriend.curCharacter')); --Change texture
            end
        end
    end
end