-- Functions.lua
-- Written by Snail

local addon = ...

function getGroups()
	if GetNumRaidMembers() > 5 then
		return math.floor((GetNumRaidMembers() / 5) + 0.5)
	end

	return 1
end

function isValid(setting)
	if setting then
		if type(setting) == 'table' then
			if setting.enabled then
				if setting.enabled == true then
					return true
				end
			else
				return true
			end
		else
			if not setting == false then
				return true
			end
		end
	end
	
	return nil
end

function settingNotFound(file, setting)
	print(addon .. ': ' .. file .. ': \'' .. setting .. '\' was not found')
end

function trim(text, text2)
	if text2 then
		if text2:len() > 0 then
			if (text:len() + text2:len()) > 11 then
				return text:sub(1, 11 - text2:len()) .. '...' .. text2
			end

			return text .. text2
		end
	end

	if text:len() > 11 then
		return text:sub(1, 8) .. '...'
	end

	return text
end
