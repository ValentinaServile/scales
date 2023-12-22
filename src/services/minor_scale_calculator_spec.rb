require_relative "../services/minor_scale_calculator"
require_relative "../entities/note"
require_relative "../entities/chromatic_scale"

describe MinorScaleCalculator do

  describe "#for_root_note" do

    root_note = Note.new("any")

    it "should calculate the scale with the correct steps and root note" do
      scale_calculator_result = []

      scale_calculator = instance_double("ScaleCalculator")
      expect(scale_calculator).to receive(:scale_for).with(
        root_note,
        ChromaticScale::NOTES,
        MinorScaleCalculator::STEPS
      ) { scale_calculator_result }

      minor_scale_calculator = MinorScaleCalculator.new(scale_calculator)
      result = minor_scale_calculator.for_root_note(root_note)

      expect(result).to be(scale_calculator_result)
    end
  end

end