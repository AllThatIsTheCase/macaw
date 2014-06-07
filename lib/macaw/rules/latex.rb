# LaTeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def latex(parameters)
    params = ''
    params << " --interaction=#{parameters.action}" if parameters.action
    params << ' --draftmode' if parameters.draft
    params << isTrue(parameters.shell) ? ' --shell-escape' : ' --no-shell-escape'
    params << " --synctex=#{parameters.synctex ? 1 : 0}"
    params << " #{parameters.options}"
    params << " #{@file.shellescape}"
    Macaw.system("latex #{params}")
  end
end
