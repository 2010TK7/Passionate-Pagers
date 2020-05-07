local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.PassionatePagers = _G.PassionatePagers or {}
PassionatePagers._path = ModPath
PassionatePagers._data_path = SavePath .. 'Tmod_TPP.txt'
PassionatePagers.settings = PassionatePagers.settings or {
	PP_loc_chn = false,
	PP_ene_all = true,
	PP_civ_die = true,
	PP_civ_tie = true
}

function PassionatePagers:Save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function PassionatePagers:Load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end