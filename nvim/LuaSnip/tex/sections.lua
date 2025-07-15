

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

