require "./src/chromatic_scale"
require "./src/scale_steps"

class MelodicMinorScaleCalculator

    MELODIC_MINOR_SCALE_ASCENDING_STEPS = [
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE
    ]

    MELODIC_MINOR_SCALE_DESCENDING_STEPS = [
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE
    ]

    def initialize(scale_calculator)
       @scale_calculator = scale_calculator
    end

    def for_root_note(root_note)
      ascending = @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_ASCENDING_STEPS)
      descending = @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_DESCENDING_STEPS, descending = true)

      ascending + descending
    end

    def for_relative_major_root_note(relative_major_root_note)
        offset = 3 * ScaleSteps::SEMITONE
        root_note_index = ChromaticScale::NOTES.find_index(relative_major_root_note) - offset
        for_root_note(ChromaticScale::NOTES[root_note_index])
    end

end