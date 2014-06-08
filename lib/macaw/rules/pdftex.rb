# PDFTeX rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  def pdftex(parameters)
    cmd = ['pdftex']
    cmd << "--interaction=#{parameters.action}" if parameters.action
    cmd << '--draftmode' if parameters.draft
    cmd << "--#{parameters.shell ? '' : 'no-'}shell-escape"
    cmd << "--synctex=#{parameters.synctex ? 1 : 0}"
    cmd << parameters.options
    cmd << @file.shellescape

    Macaw.system cmd
  end
end