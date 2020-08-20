require_relative "./chromatic_scale"
require_relative "./scale_steps"

class HarmonicMinorScaleCalculator

    HARMONIC_MINOR_SCALE_STEPS = [
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE + ScaleSteps::SEMITONE,
        ScaleSteps::SEMITONE
    ]

    def initialize(scale_calculator)
       @scale_calculator = scale_calculator
    end

    def for_root_note(root_note)
      @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, HarmonicMinorScaleCalculator::HARMONIC_MINOR_SCALE_STEPS)
    end

    def for_relative_major_root_note(relative_major_root_note)
        offset = 3 * ScaleSteps::SEMITONE
        root_note_index = ChromaticScale::NOTES.find_index(relative_major_root_note) - offset
        for_root_note(ChromaticScale::NOTES[root_note_index])
    end

end