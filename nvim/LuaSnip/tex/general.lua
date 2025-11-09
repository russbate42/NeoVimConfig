local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
    s([[\it]], fmta([[\textit{<>}]],
    { i(1, "italic") },
    { strict = false }
    )),

    s([[\bf]], fmta([[\textbf{<>}]],
    { i(1, "bold") },
    { strict = false }
    )),

    s([[\cite{]], fmta([[\cite{<>}]],
    { i(1, "bold") },
    { strict = false }
    )),

    s([[\ref{]], fmta([[\ref{<>}]],
    { i(1, "bold") },
    { strict = false }
    )),

    s([[\label{]], fmta([[\label{<>}]],
    { i(1, "bold") },
    { strict = false }
    )),

    s([[\caption{]], fmta([[\caption{<>}]],
    { i(1, "bold") },
    { strict = false }
    )),

}

