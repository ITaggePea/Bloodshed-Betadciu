-- the definitive version this time... is what I would say but I'm probably gonna find something wrong and update it again

xx = 390
yy = 900
xx2 = 390
yy2 = 900

ofs = 10
followChars = true
bfIdle = false
dadIdle = false

oppCamOfs = {}
plyCamOfs = {}
oppStgOfs = {}
plyStgOfs = {}

widthOfs = 1280
heightOfs = 720

function onCreate()
	-- adding this so I can toggle the followChars in other modcharts. will set followChars based on visibility so use setProperty('followCharsObj.')
	makeLuaSprite('followCharsObj', '', -10000, -10000)
	makeGraphic('followCharsObj', 1, 1, '000000')
	addLuaSprite('followCharsObj', true)

	loadCamOffsets()

	if followChars == true then
		if mustHitSection == true then
			snapCam(getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1] - 50, getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2] - 50)
		else
			snapCam(getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1] + 50, getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2] - 50)
		end	
	end
end

function onSectionHit()
	if followChars == true then
		if mustHitSection == true then
			triggerEvent('Camera Follow Pos', xx2, yy2)
		else
			triggerEvent('Camera Follow Pos', xx, yy)
		end	
	end
end

autoCamera = true

function onEvent(n, v1, v2)
	if n == 'Print Moving Camera Pos' then
		debugPrint('xx: '..xx..' yy: '..yy)
		debugPrint('xx2: '..xx2..' yy2: '..yy)
	end

	if n == 'Snap Moving Camera To Target' then
		if v1 == 'opponent' or v1 == 'dad' then
			instantSnapCam(getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1], getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2])
		elseif v1 == 'player' or v1 == 'bf' or v1 == 'boyfriend' then
			instantSnapCam(getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1], getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2])
		else
			instantSnapCam(v1, v2)
		end
	end

	if n == 'Change Moving Camera Pos' then
		autoCamera = false

		local opTable = {}
		local plTable = {}

		loadCamOffsets()

		for val in string.gmatch(v1, "[^%s]+") do
			table.insert(opTable, val)	
		end

		for val in string.gmatch(v2, "[^%s]+") do
			table.insert(plTable, val)	
		end

		local bothEmpty = false

		if #opTable ~= 2 and #plTable ~= 2 then
			bothEmpty = true
		end

		if #opTable ~= 2 or v1 == 'auto both' then
			opTable[1] = getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1]
			opTable[2] = getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2]
		end

		if #plTable ~= 2 or v1 == 'auto both' then
			plTable[1] = getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1]
			plTable[2] = getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2]
		end

		if v1 == 'middle' then
			local middleX = (getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1] + getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1])/2
			local middleY = (getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2] + getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2])/2
			opTable = {middleX, middleY}
			plTable = {middleX, middleY}

			bothEmpty = false
		end

		xx = opTable[1]
		yy = opTable[2]
		xx2 = plTable[1]
		yy2 = plTable[2]

		if bothEmpty == true then
			autoCamera = true
		end

		--debugPrint(xx..' '..yy)
		--debugPrint(xx2..' '..yy2)
	end

	if n == 'Change Moving Camera Focus' then
		if v1 ~= '' then
			opponentFocus = v1
		end

		if v2 ~= ''  then
			playerFocus = v2
		end
	end
end

opponentFocus = 'dad'
playerFocus = 'boyfriend'

function onUpdate()
	ofs = 15 * (0.9/getProperty('camGame.zoom'))

	followChars = getProperty('followCharsObj.visible')

	-- normally using getPropertyFromGroup wouldn't work for cameraPosition but I changed the getPropertyFromGroup function so now it does.

	if autoCamera == true then
		local oppCamOfs = getProperty(opponentFocus..'.cameraPosition')
		local plyCamOfs = getProperty(playerFocus..'.cameraPosition')

		local daXOfs = {150, -100}

		if getProperty(opponentFocus..'.flipMode') == true then
			daXOfs[1] = -100
			oppCamOfs[1] = - 1*oppCamOfs[1]
		end

		if getProperty(playerFocus..'.flipMode') == true then
			daXOfs[2] = 150
			plyCamOfs[1] = - 1*plyCamOfs[1]
		end

		xx = getMidpointX(opponentFocus..'') + daXOfs[1] + oppCamOfs[1] + oppStgOfs[1]
		yy = getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2]
		xx2 = getMidpointX(playerFocus..'') + daXOfs[2] - plyCamOfs[1] + plyStgOfs[1]
		yy2 = getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2]
	end

	if checkIdle(opponentFocus..'') == true and mustHitSection == false and followChars == true then
		dadIdle = true
		bfIdle = false
	
		if getProperty(opponentFocus..'.animation.curAnim.curFrame') < 4 then
			triggerEvent('Camera Follow Pos', xx, yy + 10)
		end

		if getProperty(opponentFocus..'.animation.curAnim.curFrame') >= 4 then
			triggerEvent('Camera Follow Pos', xx, yy)
		end
    end

    if checkIdle(playerFocus..'') == true and mustHitSection == true and followChars == true then
		bfIdle = true
		dadIdle = false

		if getProperty(playerFocus..'.animation.curAnim.curFrame')< 4 then
			triggerEvent('Camera Follow Pos', xx2, yy2 + 10)
		end

		if getProperty(playerFocus..'.animation.curAnim.curFrame') >= 4 then
			triggerEvent('Camera Follow Pos', xx2, yy2)
		end
    end	
end

function checkIdle(char)
	if getProperty(char..'.animation.curAnim.name') == 'idle' or getProperty(char..'.animation.curAnim.name') == 'danceRight' then
		return true
	end
end

function opponentNoteHit(id, note, noteType, isSustain)
	if mustHitSection == false and followChars == true then
        if note == 0 then
            triggerEvent('Camera Follow Pos', xx-ofs, yy)
        elseif note == 1 then
            triggerEvent('Camera Follow Pos', xx, yy+ofs)
        elseif note == 2 then
            triggerEvent('Camera Follow Pos', xx, yy-ofs)
        elseif note == 3 then
            triggerEvent('Camera Follow Pos', xx+ofs, yy)
        else
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    end

	dadIdle = false
	bfIdle = false
end

function goodNoteHit(id, note, noteType, isSustain)
	if mustHitSection == true and followChars == true then
        if note == 0 then
            triggerEvent('Camera Follow Pos', xx2-ofs, yy2)
        elseif note == 1 then
            triggerEvent('Camera Follow Pos', xx2, yy2+ofs)
        elseif note == 2 then
            triggerEvent('Camera Follow Pos', xx2, yy2-ofs)
        elseif note == 3 then
            triggerEvent('Camera Follow Pos', xx2+ofs, yy2)
        else
            triggerEvent('Camera Follow Pos', xx2, yy2)
        end
    end

	dadIdle = false
	bfIdle = false
end

function loadCamOffsets()
	oppCamOfs = getProperty(opponentFocus..'.cameraPosition')
	plyCamOfs = getProperty(playerFocus..'.cameraPosition')
	oppStgOfs = getProperty('opponentCameraOffset')
	plyStgOfs = getProperty('boyfriendCameraOffset')
end

--psych engine
--[[function snapCam(x, y)
	setProperty("camFollowPos.x", x)
	setProperty("camFollowPos.y", y)
end]]--

function instantSnapCam(x, y)
	snapCam(x, y)
	triggerEvent("Camera Follow Pos", x, y)
end