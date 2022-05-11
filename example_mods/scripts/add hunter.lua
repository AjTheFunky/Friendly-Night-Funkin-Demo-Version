function onCreatePost()
        makeAnimatedLuaSprite('Hunter', 'characters/HesDead', -50, 70);
        addAnimationByIndices('Hunter','danceLeft','hunteridle', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9', 24)
        addAnimationByIndices('Hunter','danceRight','hunteridle', '10, 11, 12, 13, 14, 15, 16, 17, 18, 19', 24)
        addAnimationByPrefix('Hunter','singDOWN','hunterdown',24,false)
        addAnimationByPrefix('Hunter','singLEFT','hunterleft',24,false)
        addAnimationByPrefix('Hunter','singRIGHT','hunterright',24,false)
        addAnimationByPrefix('Hunter','singUP','hunterup',24,false)
    if dadName == 'ghostbros' then
        addLuaSprite('Hunter', true);
        setProperty('Hunter.x',getProperty('dad.x')-250);
        setProperty('Hunter.y',getProperty('dad.y')+70);
    end
end
function onBeatHit()
        objectPlayAnimation('Hunter','danceRight',false)
        if curBeat % 2 == 0 then --if even beat
            objectPlayAnimation('Hunter','danceLeft',false)
        end 
end

function opponentNoteHit(id,noteData, noteType, isSustainNote)
songstarted = true

    if noteType == 'Both Bros Sing' or noteType == 'Hunter Sing' then
        triggerEvent('dad2sing',noteData,'')

    end
end

function onEvent( name, value1,value2)
    if name == "dad2sing" then

        if value1 == '0' then
            objectPlayAnimation('Hunter','singLEFT',true)
                setProperty('Hunter.offset.x',78)
                setProperty('Hunter.offset.y',-24)
        end
        if value1 == '1' then
            objectPlayAnimation('Hunter','singDOWN',true)
                setProperty('Hunter.offset.x',-40)
                setProperty('Hunter.offset.y',-40)
        end
        if value1 == '2' then
            objectPlayAnimation('Hunter','singUP',true)
                setProperty('Hunter.offset.x',35)
                setProperty('Hunter.offset.y',4)
        end
        if value1 == '3' then
            objectPlayAnimation('Hunter','singRIGHT',true)
                setProperty('Hunter.offset.x',-41)
                setProperty('Hunter.offset.y',-8)
        end
    end
end
