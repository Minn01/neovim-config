local art = require("dashboard_art")
local right_column = 66

return function(dashboard)
	-- Snacks starts the cursor at the first nonblank character on an action row.
	-- Point action rows at the menu so the cursor stays off the artwork.
	vim.api.nvim_create_autocmd("User", {
		pattern = "SnacksDashboardUpdatePost",
		once = true,
		callback = function()
			local first
			for _, item in ipairs(dashboard.items) do
				if item.action and item._ then
					item._.col = math.floor(dashboard.col) + right_column
					first = first or item
				end
			end
			if first and vim.api.nvim_win_is_valid(dashboard.win) then
				vim.api.nvim_win_set_cursor(dashboard.win, { first._.row, first._.col })
			end
		end,
	})

	local right = {}
	local title = vim.split(dashboard.opts.preset.header, "\n")
	for row, line in ipairs(title) do
		right[row] = { text = { { " " .. line, hl = "header" } } }
	end

	local row = #title + 2
	local function menu(icon, key, label, action)
		local label_text = icon .. "  " .. label
		right[row] = {
			text = {
				{ label_text, hl = "desc" },
				{ string.rep(" ", 57 - vim.fn.strdisplaywidth(label_text)) },
				{ key, hl = "key" },
			},
			key = key,
			action = action,
		}
		row = row + 2
	end

	menu("", "n", "New File", ":ene | startinsert")
	menu("", "c", "Config", ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})")
	local session = Snacks.dashboard.sections.session()
	if session then
		menu("", "s", "Restore Session", session.action)
	end
	menu("󰒲", "L", "Lazy", ":Lazy")
	menu("", "q", "Quit", ":qa")

	right[row] = { text = { { "  Recent Projects", hl = "title" } } }
	local projects = Snacks.dashboard.sections.projects({ limit = 5 })
	if #projects == 0 then
		right[row + 1] = { text = { { "   No recent projects yet", hl = "dir" } } }
	end
	for index, project in ipairs(projects) do
		local path = vim.fn.fnamemodify(project.file, ":~")
		if vim.fn.strdisplaywidth(path) > 53 then
			path = vim.fn.pathshorten(path)
		end
		if vim.fn.strdisplaywidth(path) > 53 then
			path = "…" .. vim.fn.strcharpart(path, vim.fn.strchars(path) - 52)
		end
		right[row + index] = {
			text = { { " " .. index .. "  ", hl = "key" }, { path, hl = "file" } },
			key = tostring(index),
			action = project.action,
		}
	end

	local items = {}
	for index = 1, math.max(#art, row + math.max(#projects, 1)) do
		local left = art[index] or ""
		local entry = right[index] or {}
		local text = { { left .. string.rep(" ", right_column - vim.fn.strdisplaywidth(left)), hl = "header" } }
		vim.list_extend(text, entry.text or {})
		items[index] = { text = text, key = entry.key, action = entry.action }
	end
	return items
end
