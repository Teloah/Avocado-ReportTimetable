require 'find'

Find.find('./src') do |path|
  if path.end_with?('.pas')
    puts File.basename(path)[0..-5]
  end
end
