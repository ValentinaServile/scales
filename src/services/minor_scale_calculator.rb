class MinorScaleCalculator

  STEPS = [
    ScaleSteps::TONE,
    ScaleSteps::SEMITONE,
    ScaleSteps::TONE,
    ScaleSteps::TONE,
    ScaleSteps::SEMITONE,
    ScaleSteps::TONE,
    ScaleSteps::TONE,
  ]

  def initialize(scale_calculator = ScaleCalculator.new)
    @scale_calculator = scale_calculator
  end

  def for_root_note(root_note)
    @scale_calculator.scale_for(root_note, ChromaticScale::NOTES, MinorScaleCalculator::STEPS)
  end

end