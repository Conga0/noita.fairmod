--stylua: ignore start
local ngplus_markers = {
    noclip =                    { x = 1547,         y = 14900 },
    boss_arena =                { x = 1536,         y = 13312 },
    tower_start =               { x = 9676,         y = 10110 },
    hiisi_anvil =               { x = -1984 - 100,  y = 7000 }, --close enough
    vault_entrance =            { x = 143,          y = 9728 },
    fishing_hut =               { x = -76088,       y = 140 },
    lake_statue =               { x = -78336,       y = 160 },
    big_fish =                  { x = -77488,       y = 10000 },
    desert_ruined_temple =      { x = 6144,         y = 0 },
}

local ng_markers = {
    noclip =                    { x = 1547,         y = 13876 },
}

--[[
function GetMapMarker(marker_id, return_table) --redundant but it can stay, for now
    if markers[marker_id] then
        return_table = return_table or true
        return markers[marker_id]
    end
    print_error("MARKER " .. marker_id .. " IS INVALID")
end --]]

local markers
if (tonumber(SessionNumbersGetValue("NEW_GAME_PLUS_COUNT")) or 0) > 0 then
    markers = ngplus_markers
else
    markers = ng_markers
end

return markers
--stylua: ignore end