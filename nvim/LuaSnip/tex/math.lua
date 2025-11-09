local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local f = ls.function_node

return{
  -- -- Regex "_" snippet
  -- s({
  --   trig = "([%w]+)_",  -- match alphanumerics before "_"
  --   regTrig = true,     -- enable regex
  --   wordTrig = false,   -- allow mid-word triggering
  --   hidden = false,      -- optional: hide from completion menu
  -- }, {
  --   f(function(_, snip)
  --     return snip.captures[1] .. "_{"
  --   end),
  --   i(1),
  --   t("}")
  -- }),

  s({
    trig = "^",
    regTrig = false,     -- enable regex
    wordTrig = false,   -- allow mid-word triggering
    hidden = false,      -- optional: hide from completion menu
    }, fmta([[^{<>}]],
        { i(1) },
        { strict = false })
  ),

  s({
    trig = "_",
    regTrig = false,     -- enable regex
    wordTrig = false,   -- allow mid-word triggering
    hidden = false,      -- optional: hide from completion menu
    }, fmta([[_{<>}]],
        { i(1) },
        { strict = false })
  ),

  s({trig = "\\begin{equation}", wordTrig = true},
  fmta(
    [[
    \begin{equation}
        <>
    \end{equation}
    ]],
    { i(1) },
    { strict = false }
  )),

  s({trig = "equation", wordTrig = true},
  fmta(
    [[
    \begin{equation}
        <>
    \end{equation}
    ]],
    { i(1) },
    { strict = false }
  )),

  s({trig = "\\begin{align}", wordTrig = true},
  fmta(
    [[
    \begin{align}
        <> &= \\
    \end{align}
    ]],
    { i(1) },
    { strict = false }
  )),

  s({trig = "align", wordTrig = true},
  fmta(
    [[
    \begin{align}
        <> &= \\
    \end{align}
    ]],
    { i(1) },
    { strict = false }
  )),

  s({trig = "frac", wordTrig = true},
  fmta("\\frac{<>}{<>}",
    { i(1), i(2) },
    { strict = false }
  )),

  s({trig = "\\frac", wordTrig = true},
  fmta("\\frac{<>}{<>}",
    { i(1), i(2) },
    { strict = false }
  )),

  s({trig = "\\dot", wordTrig = true},
  fmta("\\dot{<>}",
    { i(1) },
    { strict = false }
  )),

  s({trig = "dot", wordTrig = true},
  fmta("\\dot{<>}",
    { i(1) },
    { strict = false }
  )),

  s({trig = "sqrt", wordTrig = true},
  fmta("\\sqrt{<>}",
    { i(1) },
    { strict = false }
  )),

  s({trig = "\\sqrt", wordTrig = true},
  fmta("\\sqrt{<>}",
    { i(1) },
    { strict = false }
  )),

  s({trig = "\\int", wordTrig = true},
  fmta("\\int",
    {},
    { strict = false }
  )),

  s({trig = "\\int", wordTrig = true},
  fmta("\\int^{<>}_{<>}",
    { i(1), i(2) },
    { strict = false }
  ))
}

