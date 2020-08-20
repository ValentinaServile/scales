require_relative "../services/natural_minor_scale_calculator"
require_relative "../entities/note"
require_relative "../entities/chromatic_scale"

describe NaturalMinorScaleCalculator do

    describe "#for_root_note" do

        root_note = Note.new("A")

        it "should calculate the scale with the correct steps and root note" do
            scale_calculator_result = []

            scale_calculator = instance_double("ScaleCalculator")
            expect(scale_calculator).to receive(:scale_for).with(
                   root_note,
                   ChromaticScale::NOTES,
                   NaturalMinorScaleCalculator::NATURAL_MINOR_SCALE_STEPS
               ) { scale_calculator_result }

            minor_scale_calculator = NaturalMinorScaleCalculator.new(scale_calculator)
            result = minor_scale_calculator.for_root_note(root_note)

            expect(result).to be(scale_calculator_result)
        end
    end

    describe "#for_relative_major_root_note" do

        relative_major_root_note = Note.new("C")
        minor_root_note = Note.new("A")

            it "should calculate with root note shifted by 3 semitones" do
                scale_calculator_result = []

                scale_calculator = instance_double("ScaleCalculator")
                expect(scale_calculator).to receive(:scale_for).with(
                       minor_root_note,
                       ChromaticScale::NOTES,
                       NaturalMinorScaleCalculator::NATURAL_MINOR_SCALE_STEPS
                   ) { scale_calculator_result }

                minor_scale_calculator = NaturalMinorScaleCalculator.new(scale_calculator)
                result = minor_scale_calculator.for_relative_major_root_note(relative_major_root_note)

                expect(result).to be(scale_calculator_result)
            end

    end

end