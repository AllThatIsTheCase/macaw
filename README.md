# Macaw

Macaw is a Ruby Arara, a Ruby port of http://cereda.github.io/arara/. This is in many aspects very rough around the
edges at this moment as it was written in a weekend while I was busy doing other things. Ruby does rock.

## Installation

To install, make sure you have Ruby 1.9 or later installed, and then (on a command line, sorry) type

    gem install macaw-ruby

## Usage

In day-to-day use it will (should) behave exactly like arara. It accepts the same command line parameters and reads the
same *standard* rules that are bundled with arara; if you use only those, there's no need to change anything in your
LaTeX documents. Instead of

    arara

you call

    macaw

(or macaw.bat if you want to run it from a Windows IDE)

## Custom rules

Macaw doesn't use yaml for its rules; rules are Ruby scripts. Macaw will read your araraconfig.yaml to find the paths to
your custom rules; in that location, you can drop files that end in '.rb', which are structured like this:

    class Macaw # this line is mandatory
      # define your macaw rule here. The name after 'def' is the name of your rule, the options between parenthesis are yor
      # parameters. Optional parameters are marked using '=nil' (and for those of you who know ruby, this looks familiar but
      # behaves oddly; using anything else than 'nil' will likewise make the parameter optional, but you will *always* be
      # passed 'nil' if the arara rule in the tex file did not pass the parameters).
      def zoterobib(collection, format=nil, port=nil, exportCharset=nil, exportNotes=nil, useJournalAbbreviation=nil)
        # ||= assigns a value if it wasn't set; set your default values here
        format ||= 'biblatex'
        port ||= 23119

        # this adds the optional parameters to the url
        params = []
        params << "&exportCharset=#{exportCharset}" if exportCharset
        params << "&exportNotes=#{exportNotes}" if exportNotes
        params << "&useJournalAbbreviation=#{useJournalAbbreviation}" if useJournalAbbreviation

        # the ~ is a Macaw feature -- it will escape the path of the string after it to be safe to be passed on the command
        # line. It will do the right thing depending on the platform it's being run on.
        bib = ~"#{@base}.bib"
        url = ~"http://localhost:#{port}/better-bibtex/collection?#{collection}.#{format}#{params}"

        # Macaw.system executes the command, captures output, does logging, etc
        Macaw.system "curl --connect-timeout 5 -z #{bib} -o #{bib} #{url}"
      end
    end
