#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

input_file = ARGV[0]
content = File.read(input_file)

md_block = content[/\{%\s*md\s*%\}(.+?)\{%\s*endmd\s*%\}/m, 1]
abort "No {% md %} block found in #{input_file}" unless md_block

sidebar = []
current_group = nil

md_block.each_line do |line|
  case line
  when /^\* \*\*(.+)\*\*$/
    current_group = { 'text' => $1, 'items' => [] }
    sidebar << current_group
  when /^\s+\* \[(.+?)\]\((.+?)\)$/
    next unless current_group

    text = $1
    link = $2
      .sub(/\{\{puppetdb\}\}\//, '')

    current_group['items'] << { 'text' => text, 'link' => link }
  end
end

puts sidebar.to_yaml
