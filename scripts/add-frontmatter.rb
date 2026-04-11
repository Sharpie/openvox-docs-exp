#!/usr/bin/env ruby

require 'yaml'

files = Dir.glob(ARGV[0])
files.reject! { |f| File.symlink?(f) }

files.each do |file|
  content = File.read(file)

  # Naieve search for fist top-level heading
  title = content.lines.find {|l| l.start_with?('# ')}.chomp
  title.sub!(/^#[[:space:]]+/,'')

  File.open(file, 'w') do |file|
    file.write(<<~EOS)
    #{YAML.dump('title' => title, 'layout' => 'default').chomp}
    ---
    EOS

    file.write(content)
  end
end
