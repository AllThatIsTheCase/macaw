# LaTeXmk with LuaLaTeX rule for arara
# author: Brent Longborough
# requires: arara 3.0+
class Macaw
  def lualatexmk(parameters)
    cmd = []
    cmd << "latexmk -e '$pdflatex=q/lualatex%O%S/'"
    cmd << "--interaction=#{parameters.action}" if parameters.action
    cmd << "--synctex=#{parameters.synctex ? 1 : 0}"
    cmd << isTrue(parameters.shell ? "--shell-escape" : " --no-shell-escape"
    cmd << parameters.options
    cmd << "$makeindex=q/makeindex %O -s #{parameters.style}.ist -o %D %S/" if parameters.style
    cmd << "-pdf #{@file.shellescape}"

    Macaw.system(cmd.join(' '))
  end
end
