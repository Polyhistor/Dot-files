local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("article", {
    t({
      "\\documentclass{article}",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[T1]{fontenc}",
      "\\usepackage{lmodern}",
      "\\usepackage{amsmath}",
      "\\usepackage{amsfonts}",
      "\\usepackage{amssymb}",
      "\\usepackage{graphicx}",
      "",
      "\\title{",
    }),
    i(1, "Your Title"),
    t({
      "}",
      "\\author{",
    }),
    i(2, "Your Name"),
    t({
      "}",
      "\\date{\\today}",
      "",
      "\\begin{document}",
      "",
      "\\maketitle",
      "",
      "\\section{",
    }),
    i(3, "Introduction"),
    t({
      "}",
      "",
      "",
      "\\end{document}",
    }),
  }),
}
