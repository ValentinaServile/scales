require "./src/note"

class ChromaticScale
    NOTES = [
        Note.new("C"),
        Note.new("C#", sharp_notation = "C#", flat_notation = "Db"),
        Note.new("D"),
        Note.new("D#", sharp_notation = "D#", flat_notation = "Eb"),
        Note.new("E"),
        #No semitone here
        Note.new("F"),
        Note.new("F#", sharp_notation = "F#", flat_notation = "Gb"),
        Note.new("G"),
        Note.new("G#", sharp_notation = "G#", flat_notation = "Ab"),
        Note.new("A"),
        Note.new("A#", sharp_notation = "A#", flat_notation = "Bb"),
        Note.new("B"),
        #No semitone here
    ]
end