---@class utils.icon
local M = {}

---@param mappings AstroCoreMappings|AstroLSPMapping
---@param from_binding_pattern string
---@param to_binding_pattern string
---@param modes string[]
function M.move_bindings_by_pattern(
	mappings,
	from_binding_pattern,
	to_binding_pattern,
	modes
)
	for _, mode in ipairs(modes) do
		if mappings[mode] then
			for from_key, _ in pairs(mappings[mode]) do
				if mappings[mode][from_key] then
					if from_key:match(from_binding_pattern) then
						local new_binding = from_key:gsub(
							from_binding_pattern,
							to_binding_pattern
						)
						mappings[mode][new_binding] = mappings[mode][from_key]
						mappings[mode][from_key] = nil
					end
				end
			end
		end
	end
end

---@param mappings AstroCoreMappings|AstroLSPMapping
---@param from_binding string
---@param to_binding string
---@param modes string[]
function M.move_binding(mappings, from_binding, to_binding, modes)
	for _, mode in ipairs(modes) do
		if mappings[mode] and mappings[mode][from_binding] then
			mappings[mode][to_binding] = mappings[mode][from_binding]
			mappings[mode][from_binding] = nil
		end
	end
end

---@param mappings AstroCoreMappings|AstroLSPMapping
---@param from_binding string
---@param to_binding string
---@param modes string[]
function M.swap_binding(mappings, from_binding, to_binding, modes)
	for _, mode in ipairs(modes) do
		if
			mappings[mode]
			and mappings[mode][from_binding]
			and mappings[mode][to_binding]
		then
			local tmp = mappings[mode][to_binding]
			mappings[mode][to_binding] = mappings[mode][from_binding]
			mappings[mode][from_binding] = tmp
		end
	end
end

return M
