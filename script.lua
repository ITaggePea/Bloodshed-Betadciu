function onCreate()
	addTheDamnSprites()
	addShaderShit()
	makeCharacters()

	changeBFIcon('bfbl')

	iconY = getProperty('iconP1.y')

	setObjectOrder('dad1', getObjectOrder('rain') - 1)
	setObjectOrder('dad2', getObjectOrder('rain') - 1)
	setObjectOrder('boyfriend1', getObjectOrder('rain') - 1)
	setObjectOrder('noisebomb', getObjectOrder('rain') - 1)
	setObjectOrder('cup countdown', getObjectOrder('intro') - 1)


	setObjectOrder('iconP6', getObjectOrder('iconP4') - 1)
	setObjectOrder('iconP5', getObjectOrder('iconP3') - 1)
end

turnOnBotplay = false

function onEvent(n, v1, v2)
	if n == 'Asbel' then
		if v1 == 'bob' then
			doTweenAlpha('bob', 'dad1', 1, 0.75)
			setProperty('dad1.y', getProperty('dad.y') + 390)
			setProperty('dad1.x', getProperty('dad.x') + 450)

			changeDadIcon('bob')
			updateHealthbar(getProperty('dad1.iconColor'))

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
			setHealthBarColors(rgbToHex(getProperty('dad1'..'.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))

			triggerEvent('Change Moving Camera Focus', 'dad', "gf")
		end

		if v1 == 'bob2' then
			setProperty('iconP4.alpha', 1)
			changeLuaCharacter('dad1', 'bob-on')
			changeAddedIcon('iconP4', getProperty('dad1.healthIcon'))

			setProperty('dad1.y', getProperty('dad.y') + 390)
			setProperty('dad1.x', getProperty('dad.x') + 450)

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
			setProperty('iconP3.alpha', 1)
			changeBFIcon('bfbl')
			updateHealthbar('', getProperty('boyfriend.iconColor'))

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")
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
			setProperty('iconP4.alpha', 0)
			resetIconPos('iconP2')

			changeIcon('iconP2', getProperty('dad2.healthIcon'))
			updateHealthbar(getProperty('dad2.iconColor'), getProperty('boyfriend.iconColor'))

			setProperty('dad2.alpha', 1)

			doTweenY('RonUp', 'dad', getProperty('dad.y') - 125, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('dad') + 1)

			doTweenY('BobUp', 'dad1', getProperty('dad1.y') - 200, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('dad1') + 1)

			doTweenX('bf2', 'dad2', getProperty('dad2.x') + 1000, (stepCrochet*4)/500, 'quintInOut')

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
			setProperty('iconP3.alpha', 0)
			resetIconPos('iconP1')


			changeIcon('iconP1', getProperty('boyfriend1.healthIcon'))
			updateHealthbar(getProperty('dad2.iconColor'), getProperty('boyfriend1.iconColor'))


			setProperty('boyfriend1.alpha', 1)

			doTweenY('Upfriend', 'bf', getProperty('bf.y') - 125, (stepCrochet*4)/500, 'quintInOut')
			setObjectOrder('gf', getObjectOrder('bf') + 1)

			doTweenX('bambi', 'boyfriend1', getProperty('boyfriend1.x') - 1250, 0.5, 'quintInOut')

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
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then
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

		if v1 == 'pea' then
			runTimer('pea', 0.01)
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

			playSound('nonsenseboom', 0.4, 'nonsenseboom')
			triggerEvent('Screen Shake', '0.35, 0.05', '0.35, 0.05');

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

		if v1 == 'poem' then
			setProperty('Poem.alpha', 1)
			playBGAnimation('Poem', 'idle', true, false)

		     if getPropertyFromClass("flixel.FlxG", 'save.data.botplay') == false then
			   turnOnBotplay = true
			   setPropertyFromClass("flixel.FlxG", 'save.data.botplay', true)
		    end
		end

		if v1 == 'poem-2' then
			setProperty('Poem.alpha', 1)
			playBGAnimation('Poem', 'idle', true, true)
		end

		if v1 == 'poem-end' then
			setProperty('Poem.alpha', 0)

			if turnOnBotplay == true then
			   turnOnBotplay = false
			   setPropertyFromClass("flixel.FlxG", 'save.data.botplay', false)
			end
		end

		if v1 == 'eso no es bueno' then
			setProperty('dad1.alpha', 1)

			changeIcon('iconP2', getProperty('dad1.healthIcon'))
			updateHealthbar(getProperty('dad1.iconColor'), getProperty('boyfriend1.iconColor'))

			setObjectOrder('dad1', getObjectOrder('dad') + 1)
			doTweenY('sex', 'dad1', getProperty('dad1.y') - 625, 0.5, 'cubeout')
			doTweenX('yuri', 'dad', getProperty('dad.x') + 250 , 0.5)

			changeBFAuto('sunky-new')
			setProperty('boyfriend.alpha', 0)

			setProperty('dad2.x', getProperty('dad.x') + 360)
			setProperty('dad2.y', getProperty('dad.y') + 275)
			triggerEvent('Change Moving Camera Focus', 'dad2', "dad2")

			for i = 4,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end

		if v1 == 'cup-intro' then
			playSound('cupheadenter')
			setProperty('intro.alpha', 1)
			playBGAnimation('intro', 'enter', true, true)

		     if getPropertyFromClass("flixel.FlxG", 'save.data.botplay') == false then
			   turnOnBotplay = true
			   setPropertyFromClass("flixel.FlxG", 'save.data.botplay', true)
		    end
		end

		if v1 == 'cup-countdown' then
			setProperty('cup countdown.alpha', 1)
			playBGAnimation('cup countdown', 'idle', true, false)
		end

		if v1 == 'cup-intro-2' then
			playBGAnimation('intro', 'enter', true, false)
		end

		if v1 == 'cup-intro-end' then
			setProperty('cup countdown.alpha', 0)
		end

		if v1 == 'cup-countdown-end' then
			setProperty('cup countdown.alpha', 0)

			if turnOnBotplay == true then
			   turnOnBotplay = false
			   setPropertyFromClass("flixel.FlxG", 'save.data.botplay', false)
			end
		end

		if v1 == 'bye stage' then
			doTweenAlpha('black hi', 'black', 1, 0.75, 'cubeout')

			changeLuaCharacter('dad1', 'gold')
			setProperty('dad1.alpha', 0)
			doTweenAlpha('gold hi', 'dad1', 1, 0.75, 'cubeout')
			setObjectOrder('dad1', getObjectOrder('black') + 1)

			doTweenAlpha('static1', 'static1', 0, 0.75, 'cubeout')
			doTweenAlpha('static2', 'static2', 0, 0.75, 'cubeout')
		end

		if v1 == 'gold hi' then
			setTextFont('scoreTxt', 'vcr.ttf')
			setTextFont('timeTxt', 'vcr.ttf')

			setObjectOrder('dad1', getObjectOrder('black') - 1)

			changeDadAuto('gold')
			setObjectOrder('dad', getObjectOrder('black') + 1)

			changeBFAuto('bf-gf-lullaby')
			setProperty('boyfriend.alpha', 0)

			triggerEvent('Change Moving Camera Focus', 'dad2', "dad1")
			setProperty('dad2.y', getProperty('dad.y') + 25)
			setProperty('dad2.x', getProperty('dad.x') + 100)

			tweenCameraZoomIn(0.85, 0.75, "cubeinout")
			setProperty('defaultCamZoom', 0.85)

			setProperty('healthBarBG.alpha', 1)
			setProperty('healthBar.scale.y', 1.00)
			setProperty('healthBar.scale.x', 1.00)
		end

		if v1 == 'ski' then
			changeLuaCharacter('dad1', 'ski2')
			setObjectOrder('dad1', getObjectOrder('dad') + 1)
			setProperty('dad1.y', getProperty('dad.y') + 225)
			setProperty('dad1.x', getProperty('dad.x') + 400)
			characterZoom('dad1', 1.3)

			setProperty('dad1.y', getProperty('dad1.y') + 725)
			doTweenY('pow', 'dad1', getProperty('dad1.y') - 725 , 0.5)

			changeLuaCharacter('boyfriend1', 'sky2')
			setProperty('boyfriend1.alpha', 0)

			changeIcon('iconP2', getProperty('dad1.healthIcon'))
			changeIcon('iconP1', getProperty('boyfriend1.healthIcon'))
			updateHealthbar(getProperty('dad1.iconColor'), getProperty('boyfriend1.iconColor'))

			triggerEvent('Change Moving Camera Focus', 'camara para el final', "camara para el final")
			setProperty('camara para el final.y', getProperty('dad1.y') - 750)
			setProperty('camara para el final.x', getProperty('dad1.x') + 115)
		end

		if v1 == 'starved' then
			changeLuaCharacter('dad2', 'starved')
			setObjectOrder('dad2', getObjectOrder('dad') - 1)
			setProperty('dad2.y', getProperty('dad1.y') - 125)
			setProperty('dad2.x', getProperty('dad1.x') + 500)

			setProperty('dad2.y', getProperty('dad2.y') + 725)
			doTweenY('starv', 'dad2', getProperty('dad2.y') - 725 , 0.5)

			changeIcon('iconP2', getProperty('dad2.healthIcon'))
			changeIcon('iconP1', getProperty('boyfriend2.healthIcon'))
			updateHealthbar(getProperty('dad1.iconColor'), getProperty('boyfriend2.iconColor'))
		end

		if v1 == 'triple icons' then
			changeIcon('iconP2', getProperty('dad.healthIcon'))
			changeIcon('iconP1', getProperty('boyfriend.healthIcon'))
			updateHealthbar(getProperty('dad.iconColor'), getProperty('boyfriend.iconColor'))

			changeAddedIcon('iconP4', getProperty('dad1.healthIcon'))
			changeAddedIcon('iconP3', getProperty('boyfriend1.healthIcon'))

			setProperty('iconP4.alpha', 1)
			setProperty('iconP3.alpha', 1)

			changeAddedIcon('iconP6', getProperty('dad2.healthIcon'))

			setProperty('iconP6.alpha', 1)
			setProperty('iconP5.alpha', 1)
		end
	end

	if n == 'Change Stage' then
		if v1 == 'delivery' then
			cameraFlash('game', '0xFFFFFFFF', 0.7)
			changeDadAuto('Angry_peppino')
			changeGFAuto('gf-snick')
			changeBFAuto('the-noise')
			setProperty('noisebomb.visible', false)

			setProperty('dad1.alpha', 0)
			setProperty('dad2.alpha', 0)
			setProperty('boyfriend1.alpha', 0)

			setProperty('iconP4.alpha', 0)
			setProperty('iconP3.alpha', 0)

			triggerEvent('Change Moving Camera Focus', "gf", "gf")


			for i = 4,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'pixel')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'pixel' and getPropertyFromGroup('notes', i, 'mustPress') == true then
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
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then
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
					if getPropertyFromGroup('notes', i, 'style') ~= 'pixel' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'pixel')
					end
				end
			end
		end

		if v1 == 'rethink' then
			setProperty('ostatic.alpha', 1)
			doTweenAlpha('gonesa', 'ostatic', 0, 1, 'cubeout')
			setObjectCamera('ostatic', 'other')

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
					if getPropertyFromGroup('notes', i, 'style') ~= 'Nonsense_NOTE_assets' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'Nonsense_NOTE_assets')
					end
				end
			end
		end

		if v1 == 'lorethemix' then
			cameraFlash('game', '0xFFFFFFFF', 0.7)

			setTextFont('scoreTxt', 'vcr-ourple.ttf')
			setTextFont('timeTxt', 'vcr-ourple.ttf')

			changeDadAuto('mat-aw')
			changeGFAuto('emptygf')
			changeBFAuto('stephanie')

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'ourple')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'ourple' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'ourple')
					end
				end
			end
		end

		if v1 == 'LawnFront' then
			setTextFont('scoreTxt', 'PvZ.ttf')
			setTextFont('timeTxt', 'PvZ.ttf')

			changeDadAuto('Peashooter')
			changeGFAuto('zombiegf')
			changeBFAuto('ELG')

			setProperty('dad1.alpha', 0)
			setProperty('boyfriend1.alpha', 0)
			setProperty('BG1 hole.alpha', 0)

			triggerEvent('Change Moving Camera Focus', 'dad', "boyfriend")

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end

		if v1 == 'markov-closet' then
			setTextFont('scoreTxt', 'vcr.ttf')
			setTextFont('timeTxt', 'vcr.ttf')

			changeDadAuto('yuri-closeup')
			changeGFAuto('emptygf')
			changeBFAuto('sayori')

			setProperty('boyfriend.alpha', 0)

			changeLuaCharacter('dad1', 'SonicSez')
			setProperty('dad1.alpha', 0)

			setProperty('dad1.x', getProperty('dad.x') - 450)
			setProperty('dad1.y', getProperty('dad1.y') + 625)


			setProperty('dad2.x', getProperty('dad.x') + 450)
			setProperty('dad2.y', getProperty('dad.y') + 275)
			triggerEvent('Change Moving Camera Focus', 'dad2', "boyfriend")

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'doki')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'doki' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'doki')
					end
				end
			end
		end

		if v1 == 'angry-cup' then
			setTextFont('scoreTxt', 'CupheadICFont.ttf')
			setTextFont('timeTxt', 'CupheadICFont.ttf')

			changeDadAuto('cuphead-mad')
			changeGFAuto('emptygf')
			changeBFAuto('sans-i')

			setProperty('boyfriend.doMissThing', false)
			setProperty('boyfriend.stopIdle', false)
			setProperty('boyfriend.color', RGBColor(90, 104, 167))

			triggerEvent('Change Moving Camera Focus', 'dad1', "boyfriend")

			changeLuaCharacter('dad1', 'police-guy')
			setProperty('dad1.alpha', 0)
			setProperty('dad1.x', getProperty('dad.x') + 50)
			setProperty('dad1.y', getProperty('dad.y') - 425)

			for i = 0,7 do
				cancelTween(i..'Twen')
				cancelTween(i..'AngleTwen')
				setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'normal')
				noteTweenAngle(i..'AngleTwen', i, 360, (stepCrochet*4)/1000, 'cubeout')
				
				for i = 0,getProperty('notes.length') do
					if getPropertyFromGroup('notes', i, 'style') ~= 'normal' and getPropertyFromGroup('notes', i, 'mustPress') == true then
						setPropertyFromGroup('notes', i, 'texture', 'normal')
					end
				end
			end
		end
	end
end

isPsychUI = true

function onUpdate(elapsed)
	if getProperty('songStarted') == true then
		local currentBeat = (getPropertyFromClass("Conductor", "songPosition") / 1000)*(bpm/60)
	
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
		if getProperty('iconP3.alpha') ~= 0 and getProperty('iconP1.y') ~= iconY - 10 then
			setProperty('iconP1.y', iconY - 10)
			setProperty('iconP3.y', iconY + 10)

			setProperty('playerIconScale', 0.96)
		end

		if getProperty('iconP4.alpha') ~= 0 and getProperty('iconP2.y') ~= iconY - 10 then
			setProperty('iconP2.y', iconY - 10)
			setProperty('iconP4.y', iconY + 10)
			
			setProperty('opponentIconScale', 0.96)
		end

		if getProperty('iconP3.alpha') ~= 0 then
			setProperty('iconP3.flipX', getProperty('iconP1.flipX'))

			if getProperty('iconP3.flipX') then
				setProperty('iconP3.x', getProperty('iconP1.x') - 12)
			else
				setProperty('iconP3.x', getProperty('iconP1.x') + 22)
			end

			setProperty('iconP3.scale.x', getProperty('iconP1.scale.x'))
			setProperty('iconP3.scale.y', getProperty('iconP1.scale.y'))
			setProperty('iconP3.alpha', getProperty('iconP1.alpha'))
			setProperty('iconP3.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))
		end

		if getProperty('iconP4.alpha') ~= 0 then
			setProperty('iconP4.flipX', getProperty('iconP2.flipX'))
			setProperty('iconP4.scale.x', getProperty('iconP2.scale.x'))
			setProperty('iconP4.scale.y', getProperty('iconP2.scale.y'))
			setProperty('iconP4.alpha', getProperty('iconP2.alpha'))

			if getProperty('iconP4.flipX') then
				setProperty('iconP4.x', getProperty('iconP2.x') + 12)
			else
				setProperty('iconP4.x', getProperty('iconP2.x') - 55)
			end
		
			setProperty('iconP4.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'))
		end



		if getProperty('iconP5.alpha') ~= 0 and getProperty('iconP3.y') ~= iconY - 10 then
			setProperty('iconP3.y', iconY - 10)
			setProperty('iconP5.y', iconY - 30)

			setProperty('playerIconScale', 0.96)
		end

		if getProperty('iconP6.alpha') ~= 0 and getProperty('iconP4.y') ~= iconY - 10 then
			setProperty('iconP4.y', iconY - 10)
			setProperty('iconP6.y', iconY - 40)
			
			setProperty('opponentIconScale', 0.96)
		end

		if getProperty('iconP5.alpha') ~= 0 then
			setProperty('iconP5.flipX', getProperty('iconP1.flipX'))

			if getProperty('iconP5.flipX') then
				setProperty('iconP5.x', getProperty('iconP3.x') - 12)
			else
				setProperty('iconP5.x', getProperty('iconP3.x') + 40)
			end

			setProperty('iconP5.scale.x', getProperty('iconP3.scale.x'))
			setProperty('iconP5.scale.y', getProperty('iconP3.scale.y'))
			setProperty('iconP5.alpha', getProperty('iconP3.alpha'))
			setProperty('iconP5.animation.curAnim.curFrame', getProperty('iconP3.animation.curAnim.curFrame'))
		end

		if getProperty('iconP6.alpha') ~= 0 then
			setProperty('iconP6.flipX', getProperty('iconP4.flipX'))
			setProperty('iconP6.scale.x', getProperty('iconP4.scale.x'))
			setProperty('iconP6.scale.y', getProperty('iconP4.scale.y'))
			setProperty('iconP6.alpha', getProperty('iconP4.alpha'))

			if getProperty('iconP6.flipX') then
				setProperty('iconP6.x', getProperty('iconP4.x') + 12)
			else
				setProperty('iconP6.x', getProperty('iconP4.x') - 30)
			end
		
			setProperty('iconP6.animation.curAnim.curFrame', getProperty('iconP4.animation.curAnim.curFrame'))
		end
	end
end

function stepHit (step)
	if curStep == 32 then
        end
end

function onCreatePost()
end

function onTimerCompleted(t, l, ll)
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

    if t == 'pea' then
	    setProperty('Pea.alpha', 1)
	    triggerEvent('Screen Shake', '0.35, 0.05', '0.35, 0.05')
	    playSound('pea-splat', 1, 'pea')
            runTimer('pea bye', 0.25)
       end

    if t == 'pea bye' then
            doTweenAlpha('pea bai', 'Pea', 0, 0.25)
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

function addTheDamnSprites()
	makeHealthIcon('iconP6', 'starved', false)
	setObjectOrder('iconP6', getObjectOrder('iconP2') + 1)
	setProperty('iconP6.alpha', 0)

	makeHealthIcon('iconP4', 'bob', false)
	setObjectOrder('iconP4', getObjectOrder('iconP6') + 1)
	setProperty('iconP4.alpha', 0)

	makeHealthIcon('iconP5', 'tails-fof', true)
	setObjectOrder('iconP5', getObjectOrder('iconP1') + 1)
	setProperty('iconP5.alpha', 0)

	makeHealthIcon('iconP3', 'gfbl', true)
	setObjectOrder('iconP3', getObjectOrder('iconP1') + 1)
	setProperty('iconP3.alpha', 0)



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


	makeLuaSprite('Pea', 'backgrounds/stagepvz/PeaSplashing', -650, -150);
	scaleObject('Pea', 2.25, 2.25);
	addLuaSprite('Pea', false);
	setObjectCamera('Pea', 'other')
	setProperty('Pea.alpha', 0)


	makeAnimatedLuaSprite('Poem', 'backgrounds/doki/PoemTransition',  0, 0);
	addAnimationByPrefix('Poem', 'idle', 'poemtransition', 15, true)
	addLuaSprite('Poem', true)
	addLuaSprite('Poem', false);
	setObjectCamera('Poem', 'other')
	setProperty('Poem.alpha', 0)



	makeAnimatedLuaSprite('intro', 'backgrounds/indie/cup/the_thing2.0', 0, 0)
	addAnimationByPrefix('intro', 'enter', 'BOO', 24, false)
	setProperty('intro.scale.x', 1280/1200)
	setProperty('intro.scale.y', 1280/1200)
	setObjectCamera('intro', 'other')
	addLuaSprite('intro', true)
	setProperty('intro.alpha', 0)

	makeAnimatedLuaSprite('cup countdown', 'backgrounds/indie/cup/ready_wallop', -600, -100)
	addAnimationByPrefix('cup countdown', 'idle', 'Ready? WALLOP!', 24, false)
	setScrollFactor('cup countdown', 0, 0)
	setProperty('cup countdown.scale.x', 0.8)
	setProperty('cup countdown.scale.y', 0.8)
	setObjectCamera('cup countdown', 'other')
	addLuaSprite('cup countdown', true)
	setProperty('cup countdown.alpha', 0)


	makeLuaSprite('black', 'backgrounds/misc/no', -500, -350);
	setScrollFactor('black', 0, 0);
	addLuaSprite('black', false);
	setProperty('black.alpha', 0)
end

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

	makeLuaCharacter('boyfriend2', 'tails-fof', true)
	setProperty('boyfriend2.alpha', 0)

	makeLuaCharacter('dad2', 'bf2')
	setProperty('dad2.alpha', 0)
	setProperty('dad2.x', getProperty('dad.x') + 600)
	setProperty('dad2.y', getProperty('dad.y') + 680)
	setProperty('dad2.x', getProperty('dad2.x') - 1000)

	makeLuaCharacter('camara para el final', 'bf2')
	setProperty('camara para el final.alpha', 0)
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

	elseif dType == 2 then
		playDadSing = true
		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)

		playActorAnimation('dad2', sDir[note + 1], true, false)
		setProperty('dad2.holdTimer', 0)

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

function rgbToHex(color)
	local r = color[1]
	local g = color[2]
	local b = color[3]

    local rgb = (r * 0x10000) + (g * 0x100) + b
    return string.upper(string.format("%x", rgb))
end

function resetIconPos(icon)
	local scale = 'opponentIconScale'

	if getProperty(icon..'.isPlayer') == true then
		scale = 'playerIconScale'
	end

	setProperty(icon..'.y', iconY)
	setProperty(scale, 1.2)
end

function setObjectPosition(tag, x, y)
	setProperty(tag..'.x', x)
	setProperty(tag..'.y', y)
end