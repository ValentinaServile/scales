require "./melodic_minor_scale_calculator"
require "./note"
require "./chromatic_scale"

describe MelodicMinorScaleCalculator do

    describe "#for_root_note" do

        root_note = Note.new("A")

        it "should calculate the scale with the correct steps and root note, including descending" do
            scale_calculator_result_ascending = ["asc"]
            scale_calculator_result_descending = ["desc"]

            scale_calculator = instance_double("ScaleCalculator")
            expect(scale_calculator).to receive(:scale_for).with(
                   root_note,
                   ChromaticScale::NOTES,
                   MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_ASCENDING_STEPS
               ) { scale_calculator_result_ascending }
           expect(scale_calculator).to receive(:scale_for).with(
                  root_note,
                  ChromaticScale::NOTES,
                  MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_DESCENDING_STEPS,
                  true
              ) { scale_calculator_result_descending }

            minor_scale_calculator = MelodicMinorScaleCalculator.new(scale_calculator)
            result = minor_scale_calculator.for_root_note(root_note)

            expect(result).to eq(scale_calculator_result_ascending + scale_calculator_result_descending)
        end
    end

    describe "#for_relative_major_root_note" do

        relative_major_root_note = Note.new("C")
        minor_root_note = Note.new("A")

            it "should calculate with root note shifted by 3 semitones" do
                scale_calculator_result_ascending = ["asc"]
                scale_calculator_result_descending = ["desc"]

                scale_calculator = instance_double("ScaleCalculator")
                expect(scale_calculator).to receive(:scale_for).with(
                       minor_root_note,
                       ChromaticScale::NOTES,
                       MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_ASCENDING_STEPS
                   ).ordered.and_return(scale_calculator_result_ascending)

               expect(scale_calculator).to receive(:scale_for).with(
                   minor_root_note,
                   ChromaticScale::NOTES,
                   MelodicMinorScaleCalculator::MELODIC_MINOR_SCALE_DESCENDING_STEPS,
                   true
               ).ordered
               .and_return( scale_calculator_result_descending)

                minor_scale_calculator = MelodicMinorScaleCalculator.new(scale_calculator)
                result = minor_scale_calculator.for_relative_major_root_note(relative_major_root_note)

                expect(result).to eq(scale_calculator_result_ascending + scale_calculator_result_descending)
            end

    end

end