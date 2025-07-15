return {

  s("figure", fmta(
    [[
    \begin{figure}[<>]
        \centering
        \includegraphics[width=0.5\textwidth]{<>}
        \caption{<>}
        \label{<>}
    \end{figure}
    ]],
    { i(1, "placement(h|t|b|p|!|H)"),
      i(2, "figurename"),
      i(3, "figure caption"),
      i(4, "fig:figurename")},
    { strict = false }
  )),

  s("subfigure2", fmta(
    [[
    \begin{figure}[<>]
        \centering
        \begin{subfigure}[<>]{<>}
            \centering
            \includegraphics[width=\textwidth]{<>}
            \caption{<>}
            \label{<>}
        \end{subfigure}
        \hfill
        \begin{subfigure}[<>]{<>}
            \centering
            \includegraphics[width=\textwidth]{<>}
            \caption{<>}
            \label{<>}
        \end{subfigure}
    \caption{<>}
    \label{<>}
    \end{figure}
    ]],
    { i(1, "placement(h|t|b|p|!|H)"),
      i(2, "placement(h|t|b|p|!|H)"),
      i(3, ".5\\textwidth"),
      i(4, "figurename"),
      i(5, "figure caption"),
      i(6, "subfig:figurename"),
      i(7, "placement(h|t|b|p|!|H)"),
      i(8, ".5\\textwidth"),
      i(9, "figurename"),
      i(10, "figure caption"),
      i(11, "subfig:figurename"),
      i(12, "fig:figurename"),
      i(13, "figure caption")},
    { strict = false }
  )),

  s("subfigure2x2", fmta(
    [[
    \begin{figure}[<>]
        \centering
        \begin{subfigure}[<>]{<>}
            \centering
            \includegraphics[width=\textwidth]{<>}
            \caption{<>}
            \label{<>}
        \end{subfigure}
        \hfill
        \begin{subfigure}[]{}
            \centering
            \includegraphics[width=\textwidth]{}
            \caption{}
            \label{}
        \end{subfigure} %
        ~
        \centering
        \begin{subfigure}[]{}
            \centering
            \includegraphics[width=\textwidth]{}
            \caption{}
            \label{}
        \end{subfigure}
        \hfill
        \begin{subfigure}[]{}
            \centering
            \includegraphics[width=\textwidth]{}
            \caption{}
            \label{}
        \end{subfigure}
    \caption{<>}
    \label{<>}
    \end{figure}
    ]],
    { i(1, "placement(h|t|b|p|!|H)"),
      i(2, "placement(h|t|b|p|!|H)"),
      i(3, ".5\\textwidth"),
      i(4, "figurename"),
      i(5, "figure caption"),
      i(6, "subfig:figurename"),
      i(7, "fig:figurename"),
      i(8, "figure caption")},
    { strict = false }
  )),

  s("wrapfigure", fmta(
    [[
    \begin{wrapfigure}[<>]{<>}{<>}
        \centering
        \includegraphics[<>]{<>}
        \caption{<>}
        \label{<>}
    \end{wrapfigure}
    ]],
    { i(1, "lineheight (can leave out)"),
      i(2, "placement(r|l|i|o)"),
      i(3, "0.5\\textwidth"),
      i(4, "width=0.48\\textwidth"),
      i(5, "figurename"),
      i(6, "figure caption"),
      i(7, "fig:figurename")},
    { strict = false }
  ))
}

