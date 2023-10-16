function onCreate()
	addShaderShit()
	makeCharacters()

	changeBFIcon('bfbl')

	makeAnimatedLuaSprite('noisebomb', 'backgrounds/peppino/delivery/bloodsauce/noise-bomb', -850, -200)
	addAnimationByPrefix('noisebomb', 'bg', 'noise-bomb idle', 15, true)
	addLuaSprite('noisebomb', true)
	setProperty('noisebomb.antialiasing',false)
	scaleObject('noisebomb', 6, 6)
	setProperty('noisebomb.visible', false)

	setProperty('noisebomb.x', getProperty('noisebomb.x') - 250)
	setProperty('noisebomb.y', getProperty('noisebomb.y') - 250)


	makeLuaSprite('BG1 hole', 'backgrounds/Awesomix/BG1 hole', -750, -320);
	setScrollFactor('BG1 hole', 0.8, 0.8);
	scaleObject('BG1 hole', 0.8, 0.8);
	addLuaSprite('BG1 hole', false);
	setProperty('BG1 hole.visible', false)



	makeHealthIcon('iconP4', 'bob', false)
	setObjectOrder('iconP4', getObjectOrder('iconP2') + 1)
	setProperty('iconP4.alpha', 0)

	makeHealthIcon('iconP3', 'gfbl', true)
	setObjectOrder('iconP3', getObjectOrder('iconP1') + 1)
	setProperty('iconP3.alpha', 0)

	iconY = getProperty('iconP1.y')

	setObjectOrder('dad1', getObjectOrder('rain') - 1)
	setObjectOrder('dad2', getObjectOrder('rain') - 1)
	setObjectOrder('boyfriend1', getObjectOrder('rain') - 1)
	setObjectOrder('noisebomb', getObjectOrder('rain') - 1)
end

function onEvent(n, v1, v2)
	if n == 'Asbel' then
		if v1 == 'bob' then
			doTweenAlpha('bob', 'dad1', 1, 0.75)
			setProperty('dad1.y', getProperty('dad.y') + 390)
			setProperty('dad1.x', getProperty('dad.x') + 450)
			changeDadIcon('bob')
			updateHealthbar(getProperty('dad1.iconColor'))
			playDadReal = false

			triggerEvent('Change Moving Camera Focus', 'dad', "gf")

			for i = 0,3 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'gloopy')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'gloopy' and getPropertyFromGroup('notes', i, 'mustPress') == false then
						setPropertyFromGroup('notes', i, 'texture', 'gloopy')
					end
				end
			end
		end

		if v1 == 'gf-icon' then
			changeBFIcon('gfbl')
			updateHealthbar('dad1.iconColor', getProperty('gf.iconColor'))
		end

		if v1 == 'bob2' then
			useDoubleDadIcons = true
			changeLuaCharacter('dad1', 'bob-on')
			changeAddedIcon('iconP4', getProperty('dad1.healthIcon'))
			setProperty('dad1.y', getProperty('dad.y') + 390)
			setProperty('dad1.x', getProperty('dad.x') + 450)

			--setProperty('dad1.doMissThing', false)
			--setProperty('dad1.color', RGBColor(200,123,116))

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")

			changeBFIcon('gfbl')
			updateHealthbar('', getProperty('gf.iconColor'))

			for i = 0,3 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'ronhell')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'ronhell' and getPropertyFromGroup('notes', i, 'mustPress') == false then
						setPropertyFromGroup('notes', i, 'texture', 'ronhell')
					end
				end
			end
		end

		if v1 == 'bfgf' then
			useDoubleBFIcons = true
			changeBFIcon('bfbl')
			updateHealthbar('', getProperty('boyfriend.iconColor'))
		end

		if v1 == 'bye notes' then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
			noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1250, 'quintInOut')
			noteTweenX(i..'twen', i, getPropertyFromGroup('strumLineNotes', i, 'x') + 1250, 1, 'quintInOut')
		end

		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
			noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/275, 'backOut')
			noteTweenX(i..'twen', i, getPropertyFromGroup('strumLineNotes', i, 'x') - 325, 1, 'backOut')
		end
        end

		if v1 == 'bf2' then
			useDoubleDadIcons = false
			setProperty('iconP4.alpha', 0)
			setProperty('dad2.alpha', 1)

			doTweenY('RonUp', 'dad', getProperty('dad.y') - 125, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('dad') + 1)

			doTweenY('BobUp', 'dad1', getProperty('dad1.y') - 200, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('dad1') + 1)

			doTweenX('bf2', 'dad2', getProperty('dad2.x') + 1000, (stepCrochet*4)/500, 'quintInOut')
			changeDadIcon('bf2')
			updateHealthbar(getProperty('dad2.iconColor'))

			setObjectOrder('bf', getObjectOrder('gf') + 1)

			setProperty('dad2.doMissThing', false)
			setProperty('dad2.color', RGBColor(200,123,116))

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend1")

			for i = 0,3 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == false then
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end

		if v1 == 'oli chet' then
			useDoubleBFIcons = false
			setProperty('iconP3.alpha', 0)
			setProperty('boyfriend1.alpha', 1)

			doTweenY('Upfriend', 'bf', getProperty('bf.y') - 125, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('bf') + 1)

			doTweenX('bambi', 'boyfriend1', getProperty('boyfriend1.x') - 1250, 0.5, 'quintInOut')

			changeBFIcon('bambi-new')
			updateHealthbar(getProperty('dad2.iconColor'), getProperty('boyfriend1.iconColor'))
			setObjectOrder('boyfriend1', getObjectOrder('gf') + 1)

			setProperty('boyfriend1.doMissThing', false)
			setProperty('boyfriend1.color', RGBColor(200,123,116))

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend1")

			for i = 4,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end

		if v1 == 'noisebomb' then
			setProperty('noisebomb.visible', true)
			doTweenY('boom', 'noisebomb', getProperty('noisebomb.y') + 250 , 0.25)
			doTweenX('boom2', 'noisebomb', getProperty('noisebomb.x') + 250 , 0.25)
			objectPlayAnimation('noisebomb', 'bg', true)
		end

		if v1 == 'glitching in' then
			runTimer('glitchin', 0.02)
		end

		if v1 == 'donde esta el titan spikerman' then
			cameraFlash('game', '0xFFFFFFFF', 0.7)

			changeLuaCharacter('boyfriend1', 'cameraman')
			setProperty('boyfriend1.alpha', 1)

			setProperty('Overlay.alpha', 1)

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend1")
		end

		if v1 == 'police-guy' then
			setProperty('BG1 hole.visible', true)
			setObjectOrder('BG1 hole', getObjectOrder('BG1') + 1)

			doTweenX('mat', 'dad', getProperty('dad.x') - 225, 0.25, 'quintInOut')
			doTweenX('shep', 'boyfriend', getProperty('boyfriend.x') + 125, 0.25, 'quintInOut')

			changeLuaCharacter('dad1', 'police-guy')
			setProperty('dad1.alpha', 1)
			setObjectOrder('dad1', getObjectOrder('BG1 hole') + 1)

			setProperty('dad1.y', getProperty('ThePeep.y') - 225)
			setProperty('dad1.x', getProperty('ThePeep.x') - 75)

			triggerEvent("Play Animation", 'break', 'dad1')
			triggerEvent('Change Moving Camera Focus', 'dad1', "boyfriend1")

			changeDadIcon('police-guy')
			updateHealthbar(getProperty('dad1.iconColor'))
		end
	end

	if n == 'Change Stage' then
		if v1 == 'delivery' then
			cameraFlash('game', '0xFFFFFFFF', 0.7)
			changeDadAuto('Angry_peppino')
			changeGFAuto('gf-snick')
			changeBFAuto('the-noise')
			setProperty('noisebomb.visible', false)

			setProperty('dad2.alpha', 0)
			setProperty('boyfriend1.alpha', 0)

			setProperty('dad1.alpha', 0)
			useDoubleDadIcons = false
			setProperty('iconP4.alpha', 0)
			useDoubleBFIcons = false
			setProperty('iconP3.alpha', 0)

			triggerEvent('Change Moving Camera Focus', "gf", "gf")


			for i = 4,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'pixel')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'pixel' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'pixel')
					end
				end
			end
		end

		if v1 == 'stage' then
			cameraFlash('game', '0xFFFFFFFF', 0.7)
			changeDadAuto('Samantha')
			changeGFAuto('gf')
			changeBFAuto('new-francis')

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")


			for i = 4,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end

		if v1 == 'gif-classroom' then
			cancelTimer('glitchin')
			setShaderFloat(shaderName, 'PIXEL_FACTOR', 8)
			runTimer('glitchout', 0.25)

			changeDadAuto('giffany_normal')
			changeGFAuto('gif-radio')
			changeBFAuto('senpai')

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")


			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'pixel')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'pixel' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'pixel')
					end
				end
			end
		end

		if v1 == 'rethink' then
			cameraFlash('game', '0xFFFFFFFF', 0.3)
			setProperty('ostatic.alpha', 1)
			doTweenAlpha('gonesa','ostatic',0,0.4,'cubeout')

			changeDadAuto('nonsenseGod')
			changeGFAuto('gf')
			changeBFAuto('nonsensica')

			setProperty('debrisdad.alpha', 0)
			setProperty('dad.x', getProperty('dad.x') + 150)

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'Nonsense_NOTE_assets')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'Nonsense_NOTE_assets' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'Nonsense_NOTE_assets')
					end
				end
			end
		end

		if v1 == 'lorethemix' then
			--cameraFlash('game', '0xFFFFFFFF', 0.7)
			changeDadAuto('mat-aw')
			changeGFAuto('emptygf')
			changeBFAuto('stephanie')

			setProperty('debrisdad.alpha', 0)
			setProperty('dad.x', getProperty('dad.x') + 150)

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'ourple')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'ourple' and getPropertyFromGroup('notes', i, 'mustPress') == true then -- because using texture doesn't work!!??
						setPropertyFromGroup('notes', i, 'texture', 'ourple')
					end
				end
			end
		end
	end
end

function onUpdate(elapsed)
	if getProperty('songStarted') == true then
		local currentBeat = (getPropertyFromClass("Conductor", "songPosition") / 1000)*(bpm/60)
	
		if getProperty('iconP4.alpha') == 1 then
			setProperty('iconP4.scale.x', getProperty('iconP2.scale.x'))
			setProperty('iconP4.scale.y', getProperty('iconP2.scale.y'))
	
			setProperty('iconP4.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'))
		end
	
		if getProperty('iconP3.alpha') == 1 then
			setProperty('iconP3.scale.x', getProperty('iconP1.scale.x'))
			setProperty('iconP3.scale.y', getProperty('iconP1.scale.y'))
			setProperty('iconP3.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))
		end

		
		if useDoubleDadIcons == true then
			setProperty('opponentIconScale', 1.05)
			setProperty('iconP4.x', getProperty('iconP2.x') - 50)
			setProperty('iconP4.alpha', getProperty('iconP2.alpha'))
		end
	
		if useDoubleBFIcons == true then
			setProperty('playerIconScale', 1.05)
			setProperty('iconP3.x', getProperty('iconP1.x') + 30)
			setProperty('iconP3.alpha', getProperty('iconP1.alpha'))
		end

		if useDoubleDadIcons == false and getProperty('opponentIconScale') ~= 1.2 then
			setProperty('opponentIconScale', 1.2)
		end

		if useDoubleBFIcons == false and getProperty('playerIconScale') ~= 1.2 then
			setProperty('playerIconScale', 1.2)
		end
	end

	if getProperty('health') > 1.5 then
    	    doTweenAlpha('alphap', 'iconP2', 0.1, 0.5);
    	    doTweenAlpha('alphaa', 'iconP1', 1, 0.5);
	end
	if getProperty('health') > 1 and getProperty('health') < 1.5 then
    	    doTweenAlpha('alphap', 'iconP2', 0.25, 0.5);
    	    doTweenAlpha('alphaa', 'iconP1', 0.75, 0.5);
	end
	if getProperty('health') <= 1 and getProperty('health') > 0.75 then
    	    doTweenAlpha('alphap', 'iconP2', 0.5, 0.5);
    	    doTweenAlpha('alphaa', 'iconP1', 0.5, 0.5);
	end
	if getProperty('health') <= 0.75 and getProperty('health') > 0.5 then
    	    doTweenAlpha('alphap', 'iconP2', 0.75, 0.5);
    	    doTweenAlpha('alphaa', 'iconP1', 0.25, 0.5);
	end
	if getProperty('health') <= 0.5 then
    	    doTweenAlpha('alphap', 'iconP2', 1, 0.5);
    	    doTweenAlpha('alphaa', 'iconP1', 0.1, 0.5);
	end
end

function onUpdatePost()
	if useDoubleBFIcons == true then
		if getProperty('iconP1.y') ~= iconY - 20 then
			setProperty('iconP1.y', iconY - 20)
			setProperty('iconP3.y', getProperty('iconP1.y') + 40)
		end

		if getProperty('iconP3.animation.name') == 'solid' and curStep >= 1056 and curStep < 1152 then
			setProperty('iconP3.scale.x', getProperty('iconP1.scale.x') + 0.15)
			setProperty('iconP3.scale.y', getProperty('iconP1.scale.y') + 0.15)
		end
	end

	if useDoubleDadIcons == true then
		if getProperty('iconP2.y') ~= iconY - 20 then
			setProperty('iconP2.y', iconY - 20)
			setProperty('iconP4.y', getProperty('iconP2.y') + 40)
		end
	end
end

function stepHit (step)
	if curStep == 32 then
	for i = 4,7 do
		cancelTween(i..'Twen')
		cancelTween(i..'AngleTwen')
		setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
		setPropertyFromGroup('strumLineNotes', i, 'texture', 'bf-ron')
		noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
		for i = 0,getProperty('notes.length') do
			if getPropertyFromGroup('notes', i, 'style') ~= 'bf-ron' and getPropertyFromGroup('notes', i, 'mustPress') == false then
				setPropertyFromGroup('notes', i, 'texture', 'bf-ron')
			end
		   end
	    end
     end
end

function onCreatePost()
end

function onTimerCompleted(t, l, ll)
	if t == 'play oof again' then
		playSound('trainOof', 0.6)
	end

	if t == 'fail' then
		openCustomSubstate('FailState', true)
	end

    if t == 'glitchout' then
        setShaderFloat(shaderName, 'PIXEL_FACTOR',  getShaderFloat(shaderName, 'PIXEL_FACTOR') + 27)

        if getShaderFloat(shaderName, 'PIXEL_FACTOR') < screenWidth then  
            runTimer('glitchout', 0.02)
        end

        if getShaderFloat(shaderName, 'PIXEL_FACTOR') >= screenWidth then 
            setShaderFloat(shaderName, 'PIXEL_FACTOR',  screenWidth)
        end
    end

    if t == 'glitchin' then
        setShaderFloat(shaderName, 'PIXEL_FACTOR',  getShaderFloat(shaderName, 'PIXEL_FACTOR') - 55)

        if getShaderFloat(shaderName, 'PIXEL_FACTOR') > 8 then  
            runTimer('glitchin', 0.02)
        end

        if getShaderFloat(shaderName, 'PIXEL_FACTOR') <= 8 then 
            setShaderFloat(shaderName, 'PIXEL_FACTOR',  8)
        end
    end
end

isPsych = false

function daSnapCam(x, y)
	if isPsych then
		setProperty("camFollowPos.x", x)
		setProperty("camFollowPos.y", y)
	else
		snapCam(x,y)
	end
end

function instantSnapCam(x, y)
	daSnapCam(x, y)
	triggerEvent("Camera Follow Pos", x, y)
end

shaderName = "pixelate"

function addShaderShit()
	shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite(shaderName)
   
	runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);

        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject(shaderName).shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        //game.camHUD.setFilters([new ShaderFilter(game.getLuaObject(shaderName).shader)]);
        return;
    ]])

	setShaderFloat(shaderName, 'PIXEL_FACTOR', screenWidth)
	setShaderFloat(shaderName, 'COLOR_FACTOR', 256)
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

function makeCharacters()	
	makeLuaCharacter('dad1', 'bob')
	setProperty('dad1.alpha', 0)

	makeLuaCharacter('boyfriend1', 'bambi-new', true)
	setProperty('boyfriend1.alpha', 0)
	setProperty('boyfriend1.x', getProperty('bf.x') + 1250)
	setProperty('boyfriend1.y', getProperty('bf.y') + 100)

	makeLuaCharacter('dad2', 'bf2')
	setProperty('dad2.alpha', 0)
	setProperty('dad2.x', getProperty('dad.x') + 600)
	setProperty('dad2.y', getProperty('dad.y') + 680)
	setProperty('dad2.x', getProperty('dad2.x') - 1000)
end

function playerOneTurn()
    mustHit = true
end

function playerTwoTurn()
    mustHit = false
end

local sDir = {'singLEFT','singDOWN', 'singUP','singRIGHT'};
dadAlt = ""

function dadNoteHit(note, isSustain, noteType, dType)
	if dType == 0 then
		playDadSing = true
		if getProperty('dad.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('dad', sDir[note + 1].. dadAlt, true, false)
			end
		else
			playActorAnimation('dad', sDir[note + 1], true, false)
		end
	
		setProperty('dad.holdTimer', 0)

	elseif dType == 1 then
		playDadSing = false
		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)

	elseif dType == 3 then
		playDadSing = true
		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)

	elseif dType == 4 then
		playDadSing = false
		playActorAnimation('dad2', sDir[note + 1], true, false)
		setProperty('dad2.holdTimer', 0)
	end
end

function bfNoteHit(note, isSustain, noteType, dType)
	if dType == 0 then
		playBFSing = true
		if getProperty('boyfriend.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('boyfriend', sDir[note + 1].. boyfriendAlt, true, false)
			end
		else
			playActorAnimation('boyfriend', sDir[note + 1], true, false)
		end
	
		setProperty('boyfriend.holdTimer', 0)

	elseif dType == 1 then
		playBFSing = false
		playActorAnimation('boyfriend1', sDir[note + 1], true, false)
		setProperty('boyfriend1.holdTimer', 0)

	elseif dType == 3 then
		playBFSing = false
		playActorAnimation('gf', sDir[note + 1], true, false)
		setProperty('gf.holdTimer', 0)

	elseif dType == 4 then
		playBFSing = true
		playActorAnimation('gf', sDir[note + 1], true, false)
		setProperty('gf.holdTimer', 0)
	end
end

function noteMiss(id, note, noteType, isSustain, dType)
	if dType == 0 then
		playBFSing = true
		if getProperty('boyfriend.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('boyfriend', sDir[note+1]..'miss', true)
			end
		else
			playActorAnimation('boyfriend', sDir[note+1]..'miss', true)
		end
	
		setProperty('boyfriend.holdTimer', 0)

	elseif dType == 1 then
		playBFSing = false
            playActorAnimation('boyfriend1', sDir[note+1]..'miss', true)
            setProperty('boyfriend1.holdTimer', 0)

	elseif dType == 3 then
		playBFSing = false
		playActorAnimation('gf', sDir[note+1]..'miss', true)
		setProperty('gf.holdTimer', 0)

	elseif dType == 4 then
		playBFSing = true
		playActorAnimation('gf', sDir[note+1]..'miss', true)
		setProperty('gf.holdTimer', 0)
	end
end
