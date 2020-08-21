require_relative "../usecases/all_scales_for_note_use_case"

class AllScalesForNoteConsolePrinter

    def print(result)
        if result.is_a? AllScalesForNoteUseCaseError
            puts result.reason
            exit 1
        elsif result.is_a? AllScalesForNoteUseCaseResult
            puts "========== Major scale: ==============\n\n"
            puts result.major_scale.join(" ")

            puts "\n====== Relative minor scales: ========"

            puts "\nNatural minor:"
            puts result.natural_minor_scale.join(" ")

            puts "\nHarmonic minor:"
            puts result.harmonic_minor_scale.join(" ")

            puts "\nMelodic minor:"
            puts result.melodic_minor_scale.join(" ")
        end

    end

end