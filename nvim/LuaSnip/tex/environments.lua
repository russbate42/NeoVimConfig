local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

  s("itemize", fmta(
    [[
    \begin{itemize}
        \item <>
    \end{itemize}
    ]],
    { i(1) },
    { strict = false }
  )),

  s("enumerate", fmta(
    [[
    \begin{enumerate}
        \item <>
    \end{enumerate}
    ]],
    { i(1) },
    { strict = false }
  )),

  s("description", fmta(
    [[
    \begin{description}
        \item[<>] <>
    \end{description}
    ]],
    { i(1, "Description"),
      i(2, "Long description of item.")},
    { strict = false }
  )),

  s("tabular", fmta(
    [[
    \begin{tabular}{ c c c }
        \noalign{\vskip0pt}\hline\noalign{\vskip3pt}
        <> &  &  \\ 
        &  &  \\  
        &  &
        \hline
    \end{tabular}
    ]],
    { i(1) },
    { strict = false }
  )),

  s("table", fmta(
    [[
    \begin{table}[<>]
        \centering
         <> 
        \caption{<>}
        \label{<>}
    \end{table}
    ]],
    { i(1, "placement(h|t|b|p|!|H)"),
      i(2, "tabular"),
      i(3, "table caption"),
      i(4, "tab:table_label")},
    { strict = false }
  )),

  s("\\begin", fmta(
    [[
    \begin{<>}
        <>
    \end{<>}
    ]],
    {
      i(1, "environment"),
      i(2, "content"),
      rep(1),
    },
    { strict = false }
  ))
}

