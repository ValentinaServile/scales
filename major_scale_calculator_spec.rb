require "./major_scale_calculator"
require "./note"
require "./chromatic_scale"

describe MajorScaleCalculator do

    describe "#for_root_note" do

        root_note = Note.new("any")

        it "should calculate the scale with the correct steps and root note" do
            scale_calculator_result = []

            scale_calculator = instance_double("ScaleCalculator")
            expect(scale_calculator).to receive(:scale_for).with(
                   root_note,
                   ChromaticScale::NOTES,
                   MajorScaleCalculator::MAJOR_SCALE_STEPS
               ) { scale_calculator_result }

            major_scale_calculator = MajorScaleCalculator.new(scale_calculator)
            result = major_scale_calculator.for_root_note(root_note)

            expect(result).to be(scale_calculator_result)
        end
    end

end