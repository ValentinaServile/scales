require './scale_calculator'
require './note'
require './scale_steps'

describe ScaleCalculator do

  calculator = ScaleCalculator.new

  first_note = Note.new("first")
  second_note = Note.new("second")
  third_note = Note.new("third")

    notes = [
        first_note,
        second_note,
        third_note,
    ]

  describe "#scale_for" do

      it "picks next note when step is 1 semitone" do
        steps = [ScaleSteps::SEMITONE]

        result = calculator.scale_for(first_note, notes, steps)

        expect(result).to eq([first_note, second_note])
      end

      it "picks second next note when step is 1 tone" do
        steps = [ScaleSteps::TONE]

        result = calculator.scale_for(first_note, notes, steps)

        expect(result).to eq([first_note, third_note])
      end

      it "follows more than one step, continuing with the next notes" do
        steps = [ScaleSteps::SEMITONE, ScaleSteps::SEMITONE]

        result = calculator.scale_for(first_note, notes, steps)

        expect(result).to eq([first_note, second_note, third_note])
      end

      it "goes back to pick notes from the beginning when steps exceed the boundary" do
        steps = [ScaleSteps::SEMITONE, ScaleSteps::TONE]

        result = calculator.scale_for(first_note, notes, steps)

        expect(result).to eq([first_note, second_note, first_note])
      end

      it "allows to descend instead of ascend" do
        steps = [ScaleSteps::SEMITONE, ScaleSteps::SEMITONE]

        result = calculator.scale_for(third_note, notes, steps, descending = true)

        expect(result).to eq([third_note, second_note, first_note])
      end

  end

end