# Sketch rule for arara
# author: Sergey Ulyanov
# requires arara 3.0+
class Macaw
  def sketch(options=nil)
    cmd = ['sketch']
    cmd << options
    cmd << @file.shellescape
    cmd << '-o'
    cmd << "#{@base}.tex".shellescape

    Macaw.system cmd
  end
end
