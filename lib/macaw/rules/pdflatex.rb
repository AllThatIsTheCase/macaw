# PDFLaTeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def pdflatex(parameters)
    cmd = ['pdflatex']
    cmd << "--interaction=#{parameters.action}" if parameters.action
    cmd << = '--draftmode' if parameters.draft
    cmd << parameters.shell ? '--shell-escape' : '--no-shell-escape'
    cmd << "--synctex=#{parameters.synctex ? 1 : 0}"
    cmd << params.options
    cmd << @file.shellescape

    Macaw.system cmd
  end
end
