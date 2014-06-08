# LaTeXmk with pdfLaTeX rule for arara
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  def pdflatexmk(action=nil, shell=nil, synctex=nil, options=nil, style=nil)
    cmd = ["latexmk -e '$pdflatex=q/pdflatex%O%S/'"]
    cmd << "--interaction=#{action}" if action
    cmd << "--synctex=#{synctex ? 1 : 0}"
    cmd << "--#{shell ? '' : 'no-'}shell-escape"
    cmd << options
    cmd << "-e '$makeindex=q/makeindex %O -s #{~"#{style}.ist"} -o %D %S/'" if style
    cmd << '-pdf'
    cmd << ~@file

    Macaw.system cmd
  end
end
