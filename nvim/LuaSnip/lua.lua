
return {

  s("return", fmta(
    [[
    return{
        \item <>
    }
    ]],
    { i(1) },
    { strict = false }
  )),

  s("s(", fmta(
    [[
    s("return", fmta(
      \[\[
      <>{
          \item <>
      }
      \]\],
    { i(1) },
    { strict = false }
    )),
    ]],
    { i(1), "Example environment" },
    { i(2), "Tab example" },
    { strict = false }
  ))
}

