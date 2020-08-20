require_relative "./chromatic_scale"
require_relative "./scale_steps"

class MajorScaleCalculator

    MAJOR_SCALE_STEPS = [
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::TONE,
        ScaleSteps::SEMITONE,
    ]

    def initialize(scale_calculator)
        @scale_calculator = scale_calculator
    end

    def for_root_note(root_note)
        @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, MajorScaleCalculator::MAJOR_SCALE_STEPS)
    end

end