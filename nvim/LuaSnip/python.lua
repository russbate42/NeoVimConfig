local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {

    s("print", fmta([[print(<>)]],
    { i(1, "printme") },
    { strict = false }
    )),

    s("fs", fmta([[f'<> {<>}']],
    { i(1, "var"), i(2, "var") },
    { strict = false }
    )),

    s("'.format(", fmta([['.format(<>)]],
    { i(1, "var") },
    { strict = false }
    )),

    s("fmtstr", fmta([['{:}'.format(<>)]],
    { i(1, "var") },
    { strict = false }
    )),

    s("^'{:}'$", fmta([['{:^10d}'.format(<>)]],
    { i(1, "int") },
    { strict = false }
    )),

    s("^'{:}'$", fmta([['{:^6.2f}'.format(<>)]],
    { i(1, "float") },
    { strict = false }
    ))
}

-- notes: ^ and $ surrounding the trigger ensure exact trigger matching
-- If you want to ensure that the trigger matches exactly and is not part of a
-- larger word, use the wordTrig and regTrig options together with a pattern.

