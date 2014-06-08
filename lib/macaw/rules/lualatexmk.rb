# LaTeXmk with LuaLaTeX rule for arara
# author: Brent Longborough
# requires: arara 3.0+
class Macaw
  def lualatexmk(action=nil, shell=nil, synctex=nil, options=nil, style=nil)
    cmd = []
    cmd << "latexmk -e '$pdflatex=q/lualatex%O%S/'"
    cmd << "--interaction=#{action}" if action
    cmd << "--synctex=#{synctex ? 1 : 0}"
    cmd << shell ? '--shell-escape' : '--no-shell-escape'
    cmd << options
    cmd << "$makeindex=q/makeindex %O -s #{style}.ist -o %D %S/" if style
    cmd << "-pdf #{@file.shellescape}"

    Macaw.system cmd
  end
end
