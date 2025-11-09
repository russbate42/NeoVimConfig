local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
    s("\\left[", fmta(
      "\\left[ <> \\right]",
      { i(1) }
    )),

    s("\\left(", fmta(
      "\\left( <> \\right)",
      { i(1) }
    )),

    s("\\left{", fmta(
      "\\left\\{ <> \\right\\}",
      { i(1) }
    )),
}
