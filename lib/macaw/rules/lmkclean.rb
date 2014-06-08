# Clean rule for arara, via latexmk
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  rule :lmkclean => req: [], opt: %i{include} do |parameters|
    parameters.include ||= '-c'

    cmd = ['latexmk']
    cmd << parameters.include.downcase if parameters.include && %w{all -c}.include(parameters.include.downcase)
    cmd << @file.shellescape
    Macaw.system cmd
  end
end
