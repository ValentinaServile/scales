require_relative "./major_scale_calculator"
require_relative "./natural_minor_scale_calculator"
require_relative "./harmonic_minor_scale_calculator"
require_relative "./melodic_minor_scale_calculator"
require_relative "./scale_calculator"
require_relative "./chromatic_scale"

def main

    puts "Give me a note"
    note = Note.new(gets.chomp())

    if not ChromaticScale::NOTES.include?(note)
      puts "Give a valid note please"
      exit 1
    end

    scale_calculator = ScaleCalculator.new

    puts "====== Major scale is ========="
    major_scale_calculator = MajorScaleCalculator.new(scale_calculator)

    major_scale = major_scale_calculator.for_root_note(note)

    puts major_scale.join(" ")

    puts "====== Relative minors: ========"
    puts "Natural minor:"
    natural_minor_scale_calculator = NaturalMinorScaleCalculator.new(scale_calculator)

    natural_minor_scale = natural_minor_scale_calculator.for_relative_major_root_note(note)

    puts natural_minor_scale.join(" ")

    puts "Harmonic minor:"
    harmonic_minor_scale_calculator = HarmonicMinorScaleCalculator.new(scale_calculator)

    harmonic_minor_scale = harmonic_minor_scale_calculator.for_relative_major_root_note(note)

    puts harmonic_minor_scale.join(" ")

    puts "Melodic minor:"
    melodic_minor_scale_calculator = MelodicMinorScaleCalculator.new(scale_calculator)

    melodic_minor_scale = melodic_minor_scale_calculator.for_relative_major_root_note(note)

    puts melodic_minor_scale.join(" ")

end
