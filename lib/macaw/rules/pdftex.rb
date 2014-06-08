# PDFTeX rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  def pdftex(action=nil, shell=nil, synctex=nil, draft=nil, options=nil)
    cmd = ['pdftex']
    cmd << "--interaction=#{action}" if action
    cmd << '--draftmode' if draft
    cmd << "--#{shell ? '' : 'no-'}shell-escape"
    cmd << "--synctex=#{synctex ? 1 : 0}"
    cmd << options
    cmd << @file.shellescape

    Macaw.system cmd
  end
end
