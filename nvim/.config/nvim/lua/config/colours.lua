vim.opt.termguicolors = true
vim.cmd.colorscheme("wombat256mod")
vim.cmd("syntax on")

local c = {
	wombat_red = "#e5786d",
	wombat_blue = "#88b8f6",
	wombat_green = "#8fbf7f",
	wombat_white = "#e3e0d7",
	wombat_yellow = "#d4d987",
	wombat_beige = "#eadead",
	wombat_lime = "#cae982",
	wombat_gray = "#9c998e",

	none = "NONE",
	black = "#000000",
	bg = "#1A1A1A", -- dark gray
	bg_shade = "#2b2b2b",

	off_white = "#7d7b75",
	off_black = "#242424",
	off_yellow = "#eae788",

	cursor_bg = "#222222",
	cursor_line_nr = "#ffd787",

	indent = "#3a3a3a",
	line_nr = "#5f5f5f", -- yellow

	green_dark = "#335e3d",
	green_light = "#0a8016",
	red_dark = "#5c3539",
	red_light = "#ab3227",
	yellow_dark = "#4f4f00",
	yellow_light = "#787806",

	search = "#ffff00", -- yellow
	search_inc = "#ffaa00", -- orange

	visual_bg = "#554d4b",
	visual_fg = "#c3c6ca",
}

local hl = vim.api.nvim_set_hl

hl(0, "Cursor", { fg = c.off_black, bg = c.off_yellow })
hl(0, "CursorColumn", { bg = c.cursor_bg })
hl(0, "CursorLine", { bg = c.cursor_bg })
hl(0, "CursorLineNr", { fg = c.cursor_line_nr, bold = true })
hl(0, "LineNr", { fg = c.line_nr, bg = c.bg })
hl(0, "Visual", { fg = c.visual_fg, bg = c.visual_bg })

hl(0, "IncSearch", { fg = c.black, bg = c.search_inc })
hl(0, "Search", { fg = c.black, bg = c.search })

hl(0, "Function", { fg = c.wombat_lime })

hl(0, "Comment", { fg = c.wombat_gray })

hl(0, "EndOfBuffer", { bg = c.bg })
hl(0, "FloatBorder", { bg = c.bg, fg = c.off_white })
hl(0, "Normal", { bg = c.bg })
hl(0, "NormalFloat", { bg = c.bg })
hl(0, "SignColumn", { bg = c.bg })

hl(0, "String", { fg = c.wombat_green })

hl(0, "Type", { fg = c.wombat_yellow })
hl(0, "Typedef", { fg = c.wombat_yellow })
hl(0, "Structure", { fg = c.wombat_yellow })
hl(0, "StorageClass", { fg = c.wombat_yellow })

hl(0, "Conditional", { fg = c.wombat_blue })
hl(0, "Exception", { fg = c.wombat_blue })
hl(0, "Keyword", { fg = c.wombat_blue })
hl(0, "Label", { fg = c.wombat_blue })
hl(0, "Repeat", { fg = c.wombat_blue })
hl(0, "Statement", { fg = c.wombat_blue })

hl(0, "Boolean", { fg = c.wombat_red })
hl(0, "Character", { fg = c.wombat_red })
hl(0, "Constant", { fg = c.wombat_red })
hl(0, "Define", { fg = c.wombat_red })
hl(0, "Float", { fg = c.wombat_red })
hl(0, "Include", { fg = c.wombat_red })
hl(0, "Macro", { fg = c.wombat_red })
hl(0, "Number", { fg = c.wombat_red })
hl(0, "PreCondit", { fg = c.wombat_red })
hl(0, "PreProc", { fg = c.wombat_red })

hl(0, "Debug", { fg = c.wombat_beige })
hl(0, "Special", { fg = c.wombat_beige })
hl(0, "SpecialChar", { fg = c.wombat_beige })
hl(0, "SpecialComment", { fg = c.wombat_beige })
hl(0, "Tag", { fg = c.wombat_beige })

-- Diffview
hl(0, "DiffAdd", { bg = c.green_dark })
hl(0, "DiffDelete", { bg = c.red_dark })
hl(0, "DiffChange", { bg = c.yellow_dark })
hl(0, "DiffText", { bg = c.yellow_light })
hl(0, "DiffAddText", { bg = c.green_light })
hl(0, "DiffDeleteText", { bg = c.red_light })
hl(0, "DiffAddAsDelete", { bg = c.red_dark })

-- Indent Blankline
hl(0, "IblIndent", { fg = c.indent, nocombine = true })
hl(0, "IblWhitespace", { fg = c.indent, nocombine = true })

-- Command and Completion (noice, lsp, cmp)
hl(0, "NoiceCmdlinePopup", { bg = c.bg, fg = c.off_white })
hl(0, "NoiceCmdlinePopupBorder", { fg = c.wombat_green })
hl(0, "NoiceCmdlineIcon", { fg = c.wombat_green })
hl(0, "NoiceCmdlinePopupTitle", { fg = c.wombat_green, bold = true })
hl(0, "NoicePopupmenu", { bg = c.bg_shade, fg = c.off_white })
hl(0, "NoicePopupmenuBorder", { fg = c.wombat_green })
hl(0, "NoicePopupmenuSelected", { fg = c.bg, bg = c.wombat_green })

hl(
	0,
	"LspSignatureActiveParameter",
	{ fg = c.black, bg = c.wombat_green, bold = true }
)

hl(0, "CmpCursorLine", { fg = c.bg, bg = c.wombat_green })
hl(0, "CmpItemAbbr", { fg = c.wombat_white, bg = c.none })
hl(
	0,
	"CmpItemAbbrDeprecated",
	{ fg = c.wombat_gray, bg = c.none, strikethrough = true }
)
hl(0, "CmpItemAbbrMatch", { fg = c.wombat_green, bold = false })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.wombat_green, bold = false })
hl(0, "CmpItemKindDefault", { fg = c.bg, bg = c.none })
hl(0, "CmpItemMenu", { fg = c.wombat_gray, bg = c.none })
hl(0, "CmpNormal", { bg = c.bg })

hl(0, "CmpItemKindConstant", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindConstructor", { fg = c.wombat_beige, bg = c.none })
hl(0, "CmpItemKindDefault", { fg = c.wombat_white, bg = c.none })
hl(0, "CmpItemKindEnum", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindFolder", { fg = c.wombat_green, bg = c.none })
hl(0, "CmpItemKindFunction", { fg = c.wombat_lime, bg = c.none })
hl(0, "CmpItemKindKeyword", { fg = c.wombat_blue, bg = c.none })
hl(0, "CmpItemKindMethod", { fg = c.wombat_lime, bg = c.none })
hl(0, "CmpItemKindModule", { fg = c.wombat_yellow, bg = c.none })
hl(0, "CmpItemKindReference", { fg = c.wombat_green, bg = c.none })
hl(0, "CmpItemKindStruct", { fg = c.wombat_yellow, bg = c.none })
hl(0, "CmpItemKindText", { fg = c.wombat_white, bg = c.none })
hl(0, "CmpItemKindValue", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindVariable", { fg = c.wombat_white, bg = c.none })

hl(0, "CmpItemKindConstantIcon", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindConstructorIcon", { fg = c.wombat_beige, bg = c.none })
hl(0, "CmpItemKindDefaultIcon", { fg = c.wombat_white, bg = c.none })
hl(0, "CmpItemKindEnumIcon", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindFolderIcon", { fg = c.wombat_green, bg = c.none })
hl(0, "CmpItemKindFunctionIcon", { fg = c.wombat_lime, bg = c.none })
hl(0, "CmpItemKindKeywordIcon", { fg = c.wombat_blue, bg = c.none })
hl(0, "CmpItemKindMethodIcon", { fg = c.wombat_lime, bg = c.none })
hl(0, "CmpItemKindModuleIcon", { fg = c.wombat_yellow, bg = c.none })
hl(0, "CmpItemKindReferenceIcon", { fg = c.wombat_green, bg = c.none })
hl(0, "CmpItemKindStructIcon", { fg = c.wombat_yellow, bg = c.none })
hl(0, "CmpItemKindTextIcon", { fg = c.wombat_white, bg = c.none })
hl(0, "CmpItemKindValueIcon", { fg = c.wombat_red, bg = c.none })
hl(0, "CmpItemKindVariableIcon", { fg = c.wombat_white, bg = c.none })

-- Disable italics
local hl_groups = vim.api.nvim_get_hl(0, {})

for key, hl_group in pairs(hl_groups) do
	if hl_group.italic then
		hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
	end
end
