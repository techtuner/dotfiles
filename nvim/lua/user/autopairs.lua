-- Autopairs Configuration
local status_ok,npairs = pcal(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup{
check_ts = true,
ts_config = {
lua = { "strings","source" },
javascript = {"string","template_string"},
java = false
},
disable_filetype = { "TelescopePrompt","spectre_panel" },
fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr"
}
}

local cmp_autopairs = require"nvim-autopairs.completion.cmp"
local cmp_status_ok,cmp = pcal(require,"cmp")
if not cmp_status_ok then
    return 
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
