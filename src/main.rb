require_relative "./usecases/all_scales_for_note_use_case"
require_relative "./usecases/scale_for_note_use_case"
require_relative "./output/all_scales_for_note_console_printer"
require_relative "./output/scale_for_note_console_printer"
require_relative "./input/console_option_parser"
require_relative "./entities/chromatic_scale"

def main
    options = parse_options

    note = ChromaticScale.find_note(options[:note].to_s)
    if note == nil
        puts "#{options[:note].to_s} is not a valid note"
        exit 1
    end

    if options[:all]
        use_case = AllScalesForNoteUseCase.new
        console_printer = AllScalesForNoteConsolePrinter.new

        result = use_case.execute(note)
        console_printer.print(result)
        exit 0
    end

    if options[:scale]
        use_case = ScaleForNoteUseCase.new
        console_printer = ScaleForNoteConsolePrinter.new

        result = use_case.execute(note, options[:scale])
        console_printer.print(result)
    end

end
