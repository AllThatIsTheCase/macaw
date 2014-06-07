class Macaw
  def pdflatex(parameters)
    action  = parameters.action ? "--interaction=#{parameters.action}" : ''
    shell = isTrue(parameters.shell) ? "--shell-escape" : "--no-shell-escape"
    synctex = isTrue(parameters.synctex) ? "--synctex=1" : "--synctex=0"
    draft = isTrue(parameters.draft) ? "--draftmode" : ''

    Macaw.system("pdflatex #{action} #{draft} #{shell} #{synctex} #{parameters.options} #{@file.shellescape}")
  end
end
