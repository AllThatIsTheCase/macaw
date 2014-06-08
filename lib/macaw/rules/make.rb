# Make rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Makaw
  def make(parameters)
    Macaw.system "make #{parameters.task.shellescape}"
  end
end
