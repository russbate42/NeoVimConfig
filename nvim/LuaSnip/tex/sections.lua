local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {

  s([[\sec]], fmta([[\section{<>}]],
    { i(1, "Section Name") },
    { strict = false }
  )),

  s([[\sub]], fmta([[\subsection{<>}]],
    { i(1, "Sub-Section Name") },
    { strict = false }
  )),

  s([[\subsub]], fmta([[\subsubsection{<>}]],
    { i(1, "Subsub-Section Name") },
    { strict = false }
  )),

  s([[\subsubsub]], fmta([[\subsubsection{<>}]],
    { i(1, "Subsubsub-Section Name") },
    { strict = false }
  ))
}

