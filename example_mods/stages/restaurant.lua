function onCreate()
	-- background shit
	makeLuaSprite('bg', 'stages/week3bg', -5, -103);
	setScrollFactor('bg', 0.8, 0.9);

	makeLuaSprite('fg', 'stages/week3fg', -891, -200);
	setScrollFactor('fg', 1, 1);

        makeAnimatedLuaSprite('crowd', 'stages/week3crowd', 171, 61);
        addAnimationByPrefix('crowd','idle','crowd',24,true)
        setScrollFactor('crowd', 0.9, 1);

        makeAnimatedLuaSprite('crowd2', 'stages/week3crowd2', 166, 109);
        addAnimationByPrefix('crowd2','idle','crowd2',24,true)
        setScrollFactor('crowd2', 0.9, 1);

        eduardo = getRandomInt(1,100)


	addLuaSprite('bg', false);
if songName == 'Veronica' then
if eduardo == 58 then
addLuaSprite('crowd2', false);
else
addLuaSprite('crowd',false);
end
end
	addLuaSprite('fg', false);
end

function onBeatHit()
    objectPlayAnimation('crowd','idle',true)
    objectPlayAnimation('crowd2','idle',true)
end