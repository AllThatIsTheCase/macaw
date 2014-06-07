# Make animated .gif file from .pdf
# author: Chris Hughes
# last edited by: cmh, June 6th 2013
# requires arara 3.0+
#
# Sample usage:
#
# % arara: animate
# % arara: animate: {density: 200}
# % arara: animate: {density: 200, delay: 20}
#
# This rule is really just a shortcut for commands like the following
#
#  convert -delay 10 -loop 0 -density 300 myfile.pdf myfile.gif
#
# which will output myfile.gif
#
class Macaw
  def animate(parameters)
    parameters.delay ||= 10
    parameters.loop ||= 0
    parameters.density ||= 300

    Macaw.system("convert -delay #{delay} -loop #{loop} -density #{density} #{(@base + '.pdf').shellescape} #{(@base + '.gif').shellescape}"
  end
end
