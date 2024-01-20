---@class utils.icon
local M = {}

---@param kind string
---@param frames string[]
---@return StringMap
function M.build_frames(kind, frames)
	local kinds = {}
	for index, frame in ipairs(frames) do
		kinds[kind .. index] = frame
	end
	return kinds
end

return M
