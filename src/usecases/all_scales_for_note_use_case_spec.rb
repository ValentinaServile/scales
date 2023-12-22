require_relative "../usecases/all_scales_for_note_use_case"
require_relative "../services/major_scale_calculator"
require_relative "../services/natural_minor_scale_calculator"
require_relative "../services/harmonic_minor_scale_calculator"
require_relative "../services/melodic_minor_scale_calculator"
require_relative "../entities/note"

describe AllScalesForNoteUseCase do

    valid_note = Note.new("G")

    describe "#execute" do

        it "should return error if invalid note" do
            major_scale_calculator = instance_double("MajorScaleCalculator")
            natural_minor_scale_calculator = instance_double("NaturalMinorScaleCalculator")
            harmonic_minor_scale_calculator = instance_double("HarmonicMinorScaleCalculator")
            melodic_minor_scale_calculator = instance_double("MelodicMinorScaleCalculator")

            expect(major_scale_calculator).not_to receive(:for_root_note)
            expect(natural_minor_scale_calculator).not_to receive(:for_relative_major_root_note)
            expect(harmonic_minor_scale_calculator).not_to receive(:for_relative_major_root_note)
            expect(melodic_minor_scale_calculator).not_to receive(:for_relative_major_root_note)


            usecase = AllScalesForNoteUseCase.new(
                major_scale_calculator,
                natural_minor_scale_calculator,
                harmonic_minor_scale_calculator,
                melodic_minor_scale_calculator,
            )

            result = usecase.execute("WRONG_NOTE")

            expect(result).to eq(AllScalesForNoteUseCaseError.new(reason = "WRONG_NOTE is not a valid note"))
        end

        it "should return result with all scales when valid note" do
            calculator_result = []
            major_scale_calculator = instance_double("MajorScaleCalculator")
            minor_scale_calculator = instance_double("MinorScaleCalculator")
            natural_minor_scale_calculator = instance_double("NaturalMinorScaleCalculator")
            harmonic_minor_scale_calculator = instance_double("HarmonicMinorScaleCalculator")
            melodic_minor_scale_calculator = instance_double("MelodicMinorScaleCalculator")

            expect(major_scale_calculator).to receive(:for_root_note).with(valid_note) { calculator_result }
            expect(minor_scale_calculator).to receive(:for_root_note).with(valid_note) { calculator_result }
            expect(natural_minor_scale_calculator).to receive(:for_relative_major_root_note).with(valid_note) { calculator_result }
            expect(harmonic_minor_scale_calculator).to receive(:for_relative_major_root_note).with(valid_note) { calculator_result }
            expect(melodic_minor_scale_calculator).to receive(:for_relative_major_root_note).with(valid_note) { calculator_result }


            usecase = AllScalesForNoteUseCase.new(
                major_scale_calculator,
                minor_scale_calculator,
                natural_minor_scale_calculator,
                harmonic_minor_scale_calculator,
                melodic_minor_scale_calculator,
            )

            result = usecase.execute(valid_note)

            expect(result).to eq(AllScalesForNoteUseCaseResult.new(
                major_scale = calculator_result,
                minor_scale = calculator_result,
                natural_minor_scale = calculator_result,
                harmonic_minor_scale = calculator_result,
                melodic_minor_scale = calculator_result,
            ))
        end

    end

end