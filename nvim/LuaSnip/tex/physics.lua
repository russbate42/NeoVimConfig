
return {
  s("pt", fmta([[$p_T$ <>]],
    { i(1) },
    { strict = true }
  )),

  s("$", fmta("$<>$",
    { i(1) },
    { strict = false }
  )),

  s("$$", fmta("$$<>$$",
    { i(1) },
    { strict = false }
  )),

  s("|", fmta("$|<>|$",
    { i(1) },
    { strict = false }
  ))

}

