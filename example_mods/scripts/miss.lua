function noteMiss(id, direction, noteType, isSustainNote)
        playSound('miss/missnote' ..getRandomInt(1,3) .. getProperty('boyfriend.curCharacter'), 0.6, 'miss')
end