class Note
  attr_reader :name, :sharp_notation, :flat_notation, :octave

  def initialize(name, sharp_notation = nil, flat_notation = nil, octave = 4)
    @name = name
    @sharp_notation = sharp_notation
    @flat_notation = flat_notation
    @octave = octave
  end

  def ==(other_object)
     other_object.is_a? Note and @name == other_object.name
  end

  def to_s
    @name
  end
end
