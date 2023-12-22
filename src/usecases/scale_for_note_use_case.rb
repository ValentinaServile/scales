require_relative "../services/major_scale_calculator"
require_relative "../services/natural_minor_scale_calculator"
require_relative "../services/harmonic_minor_scale_calculator"
require_relative "../services/melodic_minor_scale_calculator"
require_relative "../services/minor_scale_calculator"
require_relative "../entities/chromatic_scale"

class ScaleForNoteUseCaseResult
  attr_reader :scale

  def initialize(scale)
    @scale = scale
  end

  def ==(other)
    other.is_a? ScaleForNoteUseCaseResult and other.scale == @scale
  end

end

class ScaleForNoteUseCaseError
  attr_reader :reason

  def initialize(reason)
    @reason = reason
  end

  def ==(other)
    other.is_a? ScaleForNoteUseCaseError and other.reason == @reason
  end
end

class ScaleForNoteUseCase

  def initialize(
    major_scale_calculator = MajorScaleCalculator.new,
    minor_scale_calculator = MinorScaleCalculator.new,
    natural_minor_scale_calculator = NaturalMinorScaleCalculator.new,
    harmonic_minor_scale_calculator = HarmonicMinorScaleCalculator.new,
    melodic_minor_scale_calculator = MelodicMinorScaleCalculator.new
  )
    @major_scale_calculator = major_scale_calculator
    @minor_scale_calculator = minor_scale_calculator
    @natural_minor_scale_calculator = natural_minor_scale_calculator
    @natural_minor_scale_calculator = natural_minor_scale_calculator
    @harmonic_minor_scale_calculator = harmonic_minor_scale_calculator
    @melodic_minor_scale_calculator = melodic_minor_scale_calculator
  end

  def execute (root_note, scale)
    if scale == :major
      ScaleForNoteUseCaseResult.new(@major_scale_calculator.for_root_note(root_note))
    elsif scale == :minor
      ScaleForNoteUseCaseResult.new(@minor_scale_calculator.for_root_note(root_note))
    elsif scale == :relative_natural_minor
      ScaleForNoteUseCaseResult.new(@natural_minor_scale_calculator.for_relative_major_root_note(root_note))
    elsif scale == :relative_harmonic_minor
      ScaleForNoteUseCaseResult.new(@harmonic_minor_scale_calculator.for_relative_major_root_note(root_note))
    elsif scale == :relative_melodic_minor
      ScaleForNoteUseCaseResult.new(@melodic_minor_scale_calculator.for_relative_major_root_note(root_note))
    else
      ScaleForNoteUseCaseError.new("Unknown scale")
    end
  end

end