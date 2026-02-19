-- local cmp = require("cmp")
--
-- local default_config = {
-- 	auto_open = true,
-- }

local M = {
	source = {},
}

-- function M.setup(config)
-- 	if config == nil then
-- 		config = default_config
-- 	else
-- 		config = vim.tbl_deep_extend("keep", config, default_config)
-- 	end
--
-- 	if config.auto_open then
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "LuasnipChoiceNodeEnter",
-- 			callback = function()
-- 				vim.schedule(function()
-- 					cmp.complete({
-- 						config = {
-- 							sources = {
-- 								{ name = "luasnip_choice" },
-- 							},
-- 						},
-- 					})
-- 				end)
-- 			end,
-- 		})
-- 	end
-- end

M.source.new = function()
	return setmetatable({}, { __index = M.source })
end

-- function M.source:is_available()
-- 	return require("luasnip.session").active_choice_node
-- end
--
-- function M.source:execute(completion_item, callback)
-- 	require("luasnip").set_choice(completion_item.index)
-- 	callback(completion_item)
-- end
--
-- function M.source:get_keyword_pattern()
-- 	return ""
-- end

M.source.complete = function(_, _, callback)
	local items = {}
	local active_choice_nodes = require("luasnip.session").active_choice_nodes
	if active_choice_nodes == nil or active_choice_nodes[1] == nil then
		callback({})
		return
	end

	local choices = active_choice_nodes[1].choices
	vim.print(choices)
	vim.print(choices)
	vim.print(choices)
	vim.print(choices)
	vim.print(choices)
	vim.print(choices)
	for _, choice in ipairs(choices) do
		local label = choice:get_static_text()
		table.insert(items, {
			word = label,
			label = label,
			filterText = label,
		})
	end

	callback({ items })
end

-- function M.source:get_debug_name()
-- 	return "luasnip_choice"
-- end

return M
