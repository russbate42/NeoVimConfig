-- CPP SNIPPETS
-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua

return {
  -- A boilerplate for a cpp main program
  require("luasnip").snippet(
    { trig="cpp_main", description="cpp boilerplate main"},
    { t({"first line", "first line", "first line"}) }
  ),

  s("cppf",
  t({"int function()", "    ", "return 0;"})),

--[[
void PrintHello(){
    strd::cout << "Hello, world";
}

int main() {
    PrintHello();
    return 0;
} ]]

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  )
}
