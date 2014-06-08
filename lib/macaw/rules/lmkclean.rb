# Clean rule for arara, via latexmk
# author: Brent Longborough
# requires arara 3.0+
class Macaw
  def lmkclean(include=nil)
    include ||= '-c'

    cmd = ['latexmk']
    cmd << include.downcase if include && %w{all -c}.include(include.downcase)
    cmd << ~@file
    Macaw.system cmd
  end
end
