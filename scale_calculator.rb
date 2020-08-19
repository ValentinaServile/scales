class ScaleCalculator

  def scale_for(note, notes, steps, descending = false)
    result = [note]
    next_note_index = notes.find_index(note)

    steps.each do |step_value|
        step = descending ? step_value * -1 : step_value
        next_note_index = (next_note_index + step) % notes.length
        next_note = notes[next_note_index]
        result = result.push(next_note)
    end

    return result
  end
  
end
