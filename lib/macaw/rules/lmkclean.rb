# Clean rule for arara, via latexmk
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  def lmkclean(parameters)
    parameters.include ||= '-c'

    params = ''
    params << " #{parameters.include.downcase}" if parameters.include && %w{all -c}.include(parameters.include.downcase)
    params << " #{@file.shellescape}"
    Macaw.system("latexmk #{params}")
  end
end
