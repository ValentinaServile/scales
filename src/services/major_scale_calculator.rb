require_relative "../entities/chromatic_scale"
require_relative "../entities/scale_steps"
require_relative "../services/scale_calculator"

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

    def initialize(scale_calculator = ScaleCalculator.new)
        @scale_calculator = scale_calculator
    end

    def for_root_note(root_note)
        @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, MajorScaleCalculator::MAJOR_SCALE_STEPS)
    end

end