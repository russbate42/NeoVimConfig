
return{
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
  ))
}

