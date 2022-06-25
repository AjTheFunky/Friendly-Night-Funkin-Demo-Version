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

        makeAnimatedLuaSprite('skye', 'stages/week3skye', -600, 210);
        addAnimationByPrefix('skye','idle','skyeidle',24,false)
        addAnimationByPrefix('skye','clap','skyeclap',24,false)
        setScrollFactor('skye', 1, 1);

        makeAnimatedLuaSprite('cg', 'stages/week3cg', 1850, 230);
        addAnimationByPrefix('cg','idle','cg',24,true)
        setScrollFactor('cg', 1, 1);

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
if songName == 'Veronica' or songName == 'Party' then
addLuaSprite('skye',false);
addLuaSprite('cg',false);
end
end

function onBeatHit()
    objectPlayAnimation('crowd','idle',true)
    objectPlayAnimation('crowd2','idle',true)
    objectPlayAnimation('cg','idle',true)
    objectPlayAnimation('skye','idle',true)
end