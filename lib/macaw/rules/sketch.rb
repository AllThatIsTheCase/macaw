# Sketch rule for arara
# author: Sergey Ulyanov
# requires arara 3.0+
class Macaw
  rule :sketch => opt: %i{options}, req: [] do |parameters|
    cmd = ['sketch']
    cmd << parameters.options
    cmd << @file.shellescape
    cmd << '-o'
    cmd << "#{@base}.tex".shellescape

    Macaw.system cmd
  end
end
