

function interacting(entity_who_interacted, entity_interacted, interactable_name)
	local radio_is_on = EntityGetFirstComponent(entity_interacted, "AudioLoopComponent", "radio_on") ~= nil
	local entity = GetUpdatedEntityID()

	if not radio_is_on then
		EntitySetComponentsWithTagEnabled(entity, "radio_on", true)
		EntitySetComponentsWithTagEnabled(entity, "radio_off", false)
		local audiocomp = EntityGetFirstComponent(entity, "AudioLoopComponent")
		if audiocomp then ComponentSetValue2(audiocomp, "event_name", "radio/" .. (Random(1, 10) == 9 and "ill_see_you_when_i_see_you" or "loop")) end
		GlobalsSetValue("radios_activated", tostring(tonumber(GlobalsGetValue("radios_activated", "0")) + 1))
	else
		EntitySetComponentsWithTagEnabled(entity, "radio_on", false)
		EntitySetComponentsWithTagEnabled(entity, "radio_off", true)
		GlobalsSetValue("radios_activated", tostring(tonumber(GlobalsGetValue("radios_activated", "0")) - 1))
	end
end
