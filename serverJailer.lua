local jailPassword = "wwrp2020" 
local maxsecs = 1000

RegisterCommand("jail", function(source, args, rawCommand)

	if tablelength(args) > 3 then

		if args[1] == jailPassword then

			local tPID = tonumber(args[2])
			local jT = tonumber(args[3])
			local reason = table.concat(args, " ", 4)

			if jT > maxsecs then
				jT = maxsecs
			end

			if GetPlayerName(tPID) ~= nil then

				print("Jailing ".. GetPlayerName(tPID).. " for ".. jT .." secs due to " .. reason .. "- cm entered by ".. GetPlayerName(source))
				TriggerClientEvent("JP", tPID, jT)
				TriggerClientEvent('chatMessage', -1, '[^8Jailer^0]', { 0, 0, 0 }, GetPlayerName(tPID) ..' has been jailed for '.. jT ..' months. Reason: ' .. reason)

			end

		else

			TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Incorrect jail password entered, please try again.')
			print("Incorrect jailPassword entered by ".. GetPlayerName(source))

		end
		
	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

RegisterCommand("unjail", function(source, args, rawCommand)

	if tablelength(args) > 1 then

		if args[1] == jailPassword then

			local tPID = tonumber(args[2])
			if GetPlayerName(tPID) ~= nil then
				print("Unjailing ".. GetPlayerName(tPID).. " - cm entered by ".. GetPlayerName(source))
				TriggerClientEvent("UnJP", tPID)
			end

		else

			TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Incorrect jail password entered, please try again.')
			print("Incorrect jailPassword entered by ".. GetPlayerName(source))

		end
		
	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

RegisterCommand("jailme", function(source, args, rawCommand)

	if tablelength(args) > 1 then

		local jT = tonumber(args[1])
		local reason = table.concat(args, " ", 2)
		
		if jT > maxsecs then

			jT = maxsecs

		end

		print("Jailing ".. GetPlayerName(source) .. " for ".. jT .." secs due to " .. reason)
		TriggerClientEvent("JP", source, jT)
		TriggerClientEvent('chatMessage', -1, 'JUDGE', { 0, 0, 0 }, GetPlayerName(source) ..' jailed for '.. jT ..' secs due to ' .. reason)
		
	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end