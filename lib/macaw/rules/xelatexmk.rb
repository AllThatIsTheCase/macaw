# LaTeXmk with XeLaTeX rule for arara
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  def xelatexmk(action, shell=nil, synctex=nil, style=nil)
    Macaw.system [
      "latexmk -e '$pdflatex=q/xelatex%O%S/' --interaction=#{action} --synctex=#{synctex ? 1 : 0} --#{shell ?  '' : 'no-'}shell-escape",
      options, 
      style ? "-e '$makeindex=q/makeindex %O -s #{style}.ist -o %D %S/'" : nil,
      '-pdf',
      @file.shellescape
    ]
  end
end
