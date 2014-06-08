# Make rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Makaw
  rule :make => opt: %i{task}, req: [] do |parameters|
    parameters.task ||= ''
    Macaw.system "make #{parameters.task.shellescape}"
  end
end
