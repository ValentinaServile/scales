
class ScaleForNoteConsolePrinter

  def print(result)
    if result.is_a? ScaleForNoteUseCaseError
      puts result.reason
      exit 1
    elsif result.is_a? ScaleForNoteUseCaseResult
      puts result.scale.join(" ")
    end

  end

end