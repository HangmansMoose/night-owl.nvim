
local theme = require("night-owl.theme")

local M = {}
M._options = nil

--- Loads the theme without going through the default activation.
function M._load()
	local ok, result = pcall(function()
	    local config = require("night-owl.config")

        if not ok then
		vim.notify("Failed to load night-owl colorscheme: " .. tostring(result), vim.log.levels.ERROR)
	end

	M.load(M._options)
end

---@param opts Config|nil
function M.load(opts)
	if opts then
		config.extend(opts)
	end
	theme.set_highlights(opts)
end

M.setup = config.setup

return M
