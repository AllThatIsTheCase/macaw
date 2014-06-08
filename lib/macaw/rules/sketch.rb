# Sketch rule for arara
# author: Sergey Ulyanov
# requires arara 3.0+
class Macaw
  def sketch(options=nil)
    cmd = ['sketch']
    cmd << options
    cmd << ~@file
    cmd << '-o'
    cmd << ~"#{@base}.tex"

    Macaw.system cmd
  end
end
