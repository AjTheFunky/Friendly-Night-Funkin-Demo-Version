function onCreatePost()
if getProperty('boyfriend.curCharacter') == 'lexi' then
    setPropertyFromClass('GameOverSubstate', 'characterName', 'lexi'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'lexilose'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'lexiok'); --put in mods/music/
end
end