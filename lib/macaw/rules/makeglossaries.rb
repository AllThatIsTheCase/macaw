# MakeGlossaries rule for arara
# author: Marco Daniel
# requres arara 3.0+
class Macaw
  def makeglossaries(options=nil)

    Macaw.system ['makeglossaries', options, @base.shellescape]
  end
end
