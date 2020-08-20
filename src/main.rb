require_relative "./usecases/all_scales_for_note_use_case"
require_relative "./output/all_scales_for_note_console_printer"

def main

    puts "Give me a note"
    note = Note.new(gets.chomp())

    all_scales_for_note_use_case = AllScalesForNoteUseCase.new
    all_scales_for_note_console_printer = AllScalesForNoteConsolePrinter.new

    result = all_scales_for_note_use_case.execute(note)
    all_scales_for_note_console_printer.print(result)

end
