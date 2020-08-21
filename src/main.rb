require 'optparse'
require_relative "./usecases/all_scales_for_note_use_case"
require_relative "./output/all_scales_for_note_console_printer"

def main
    options = parse_options

    if options[:all]
        note = Note.new(options[:note].to_s)

        all_scales_for_note_use_case = AllScalesForNoteUseCase.new
        all_scales_for_note_console_printer = AllScalesForNoteConsolePrinter.new

        result = all_scales_for_note_use_case.execute(note)
        all_scales_for_note_console_printer.print(result)
    end

end

def parse_options
    options = {}
    help = ""

    begin
        OptionParser.new do |opts|
          opts.banner =
"Scales

Usage:
    scales (a | --all) <note>
    scales -h | --help

Options:
"
          opts.on("-a", "--all", "Displays all major and minor scales of given note") do |a|
            options[:all] = a
          end

          opts.on("-h", "--help", "Prints this help") do |h|
            options[:help] = h
          end

          help = opts
        end.parse!

    rescue OptionParser::InvalidOption
        puts help
        exit 1
    end

    if ARGV.length == 0
        puts help
        exit 1
    end
    options[:note] = ARGV[0]

    if options[:help]
        puts help
        exit 0
    end
    options
end