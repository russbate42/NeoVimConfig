local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

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
  )),

  s({trig = "\\dd", wordTrig = true},
  fmta("\\dd{<>}",
    { i(1) },
    { strict = false }
  )),

  s({trig = "\\dd", wordTrig = true},
  fmta("\\dd[<>]{<>}",
    { i(1), i(2) },
    { strict = false }
  )),

-- \dd{x} → dx automatic spacing based on neighbors
-- \dd[3]{x} → d
-- 3x optional power
-- \dd(\cos\theta) → d(cos θ) long-form; automatic braces
-- \derivative \dv{x} →
-- d
-- dx
-- one argument
-- \dv{f}{x} →
-- df
-- dx
-- two arguments
-- \dv[n]{f}{x} →
-- d
-- nf
-- dx
-- n
-- optional power
-- \dv{x}(\grande) →
-- d
-- dx
--  
-- long-form; automatic braces, spacing
-- \dv*{f}{x} → df/dx inline form using \flatfrac
-- \partialderivative \pderivative{x} →
-- ∂
-- ∂x alternate name
-- \pdv{x} →
-- ∂
-- ∂x shorthand name
-- \pdv{f}{x} →
-- ∂f
-- ∂x two arguments
-- \pdv[n]{f}{x} →
-- ∂
-- nf
-- ∂xn
-- optional power
-- 5
-- \pdv{x}(\grande) →
-- ∂
-- ∂x 
-- long-form
-- \pdv{f}{x}{y} →
-- ∂
-- 2f
-- ∂x∂y mixed partial
-- \pdv*{f}{x} → ∂f/∂x inline form using \flatfrac
-- \variation \var{F[g(x)]} → δF[g(x)] functional variation (works like \dd)
-- \var(E-TS) → δ(E − T S) long-form
-- \functionalderivative \fdv{g} →
-- δ
-- δg functional derivative (works like \dv)
-- \fdv{F}{g} →
-- δF
-- δg
-- \fdv{V}(E-TS) →
-- δ
-- δV (E − T S) long-form
-- \fdv*{F}{x} → δF/δx inline form using \flatfrac
}

