
return {

s("book", fmta(
[[
\documentclass[<>]{book}

\usepackage{import} % for importing alternative to include\input
\input{preamble}
\input{geometry}
\input{header}

\begin{document}
\chapter{<>}
\chapter{<>}
\chapter{<>}
\chapter{<>}
\input{bibliography.tex}
\end{document}
]],
{ i(1, "12pt"),
  i(2, "Introduction"),
  i(3, "Chapter Title"),
  i(4, "Chapter Title"),
  i(5, "Conclusion") },
{ strict = false }
)),

s("\\documentclass", fmta(
[[
\documentclass[<>]{book}

\usepackage{import} % for importing alternative to include\input
\input{preamble}
\input{geometry}
\input{header}

\begin{document}
\chapter{<>}
\chapter{<>}
\chapter{<>}
\chapter{<>}
\input{bibliography.tex}
\end{document}
]],
{ i(1, "12pt"),
  i(2, "Introduction"),
  i(3, "Chapter Title"),
  i(4, "Chapter Title"),
  i(5, "Conclusion") },
{ strict = false }
)),

s("\\documentclass", fmta(
[[
\documentclass[<>]{article}

\usepackage{import} % for importing alternative to include\input
\input{preamble}
\input{geometry}
\input{header}

\begin{document}
\section{<>}
\section{<>}
\section{<>}
\section{<>}
\input{bibliography.tex}
\end{document}
]],
{ i(1, "12pt"),
  i(2, "Introduction"),
  i(3, "Section Title"),
  i(4, "Section Title"),
  i(5, "Conclusion") },
{ strict = false }
)),

s("article", fmta(
[[
\documentclass[<>]{article}

\usepackage{import} % for importing alternative to include\input
\input{preamble}
\input{geometry}
\input{header}

\begin{document}
\section{<>}
\section{<>}
\section{<>}
\section{<>}
\input{bibliography.tex}
\end{document}
]],
{ i(1, "12pt"),
  i(2, "Introduction"),
  i(3, "Section Title"),
  i(4, "Section Title"),
  i(5, "Conclusion") },
{ strict = false }
))

}

