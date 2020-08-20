require_relative "../services/major_scale_calculator"
require_relative "../services/natural_minor_scale_calculator"
require_relative "../services/harmonic_minor_scale_calculator"
require_relative "../services/melodic_minor_scale_calculator"
require_relative "../entities/chromatic_scale"

class AllScalesForNoteUseCaseResult
    attr_reader :major_scale, :natural_minor_scale, :harmonic_minor_scale, :melodic_minor_scale

    def initialize(major_scale, natural_minor_scale, harmonic_minor_scale, melodic_minor_scale)
        @major_scale = major_scale
        @natural_minor_scale = natural_minor_scale
        @harmonic_minor_scale = harmonic_minor_scale
        @melodic_minor_scale = melodic_minor_scale
    end

    def ==(other)
        other.is_a? AllScalesForNoteUseCaseResult and
        other.major_scale == @major_scale #and
        other.natural_minor_scale == @natural_minor_scale and
        other.harmonic_minor_scale == @harmonic_minor_scale and
        other.melodic_minor_scale == @melodic_minor_scale
    end

end

class AllScalesForNoteUseCaseError
    attr_reader :reason

    def initialize(reason)
        @reason = reason
    end

    def ==(other)
        other.is_a? AllScalesForNoteUseCaseError and other.reason == @reason
    end
end

class AllScalesForNoteUseCase

    def initialize(
            major_scale_calculator = MajorScaleCalculator.new,
            natural_minor_scale_calculator = NaturalMinorScaleCalculator.new,
            harmonic_minor_scale_calculator = HarmonicMinorScaleCalculator.new,
            melodic_minor_scale_calculator = MelodicMinorScaleCalculator.new
        )
        @major_scale_calculator = major_scale_calculator
        @natural_minor_scale_calculator = natural_minor_scale_calculator
        @harmonic_minor_scale_calculator = harmonic_minor_scale_calculator
        @melodic_minor_scale_calculator = melodic_minor_scale_calculator
    end

    def execute (root_note)
        if not ChromaticScale::NOTES.include?(root_note)
          return AllScalesForNoteUseCaseError.new(reason = "#{root_note} is not a valid note")
        end

        AllScalesForNoteUseCaseResult.new(
            major_scale = @major_scale_calculator.for_root_note(root_note),
            natural_minor_scale = @natural_minor_scale_calculator.for_relative_major_root_note(root_note),
            harmonic_minor_scale = @harmonic_minor_scale_calculator.for_relative_major_root_note(root_note),
            melodic_minor_scale = @melodic_minor_scale_calculator.for_relative_major_root_note(root_note),
        )
    end

end