require 'optparse'
def parse_options
  options = {}

  OptionParser.new do |opts|
    opts.banner =
      "Usage: scales -a <root-note>

Options:
"
    opts.on("-a", "--all [NOTE]", String, "Displays all scales of given note") do |note|
      options[:all] = true
      options[:note] = note
    end

    opts.on("-M", "--major [NOTE]", String, "Major scale of given note") do |note|
      options[:scale] = :major
      options[:note] = note
    end

    opts.on("-m", "--minor [NOTE]", String, "Minor scale of given note") do |note|
      options[:scale] = :minor
      options[:note] = note
    end

    opts.on("-n", "--relative-natural-minor [NOTE]", String, "Relative natural minor scale of given note") do |note|
      options[:scale] = :relative_natural_minor
      options[:note] = note
    end

    opts.on("-H", "--relative-harmonic-minor [NOTE]", String, "Relative harmonic minor scale of given note") do |note|
      options[:scale] = :relative_harmonic_minor
      options[:note] = note
    end

    opts.on("-o", "--relative-melodic-minor [NOTE]", String, "Relative melodic minor scale of given note") do |note|
      options[:scale] = :relative_melodic_minor
      options[:note] = note
    end

    opts.on_tail("-h", "--help", "Prints this help") do
      puts opts
      exit 0
    end

  end.parse!

  options
end