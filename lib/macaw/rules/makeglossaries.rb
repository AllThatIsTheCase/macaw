# MakeGlossaries rule for arara
# author: Marco Daniel
# requres arara 3.0+
class Macaw
  def makeglossaries(parameters)
    cmd = ['makeglossaries']
    cmd << parameters.options
    cmd << @base.shellescape

    Macaw.system cmd
  end
end
