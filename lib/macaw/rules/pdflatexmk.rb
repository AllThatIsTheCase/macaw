# LaTeXmk with pdfLaTeX rule for arara
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  def pdflatexmk(parameters)
    cmd = ["latexmk -e '$pdflatex=q/pdflatex%O%S/'"]
    cmd << "--interaction=#{parameters.action}" if parameters.action
    cmd << "--synctex=#{parameters.synctex ? 1 : 0}"
    cmd << "--#{parameters.shell ? '' : 'no-'}shell-escape"
    cmd << parameters.options
    cmd << "-e '$makeindex=q/makeindex %O -s #{"#{parameters.style}.ist".shellescape} -o %D %S/'" if parameters.style
    cmd << '-pdf'
    cmd << @file.shellescape

    Macaw.system cmd
  end
end
