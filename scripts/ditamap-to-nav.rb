#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rexml/document'
require 'yaml'

input_file = ARGV[0]
abort "Usage: #{$PROGRAM_NAME} <ditamap>" unless input_file

doc = REXML::Document.new(File.read(input_file))
base_dir = File.dirname(input_file)

def title_from_md(base_dir, href)
  path = File.join(base_dir, href)
  return nil unless File.exist?(path)

  frontmatter = File.read(path)[/\A---\n(.+?\n)---/m, 1]
  return nil unless frontmatter

  YAML.safe_load(frontmatter)&.dig('title')
end

def nav_title(element, base_dir)
  if (nt = element.attributes['navtitle'])
    return nt
  end

  href = element.attributes['href']
  return nil unless href

  title_from_md(base_dir, href) || href.sub(/\.md$/, '')
end

def convert_href(href)
  href.sub(/\.md$/, '.html')
end

def make_item(topicref, base_dir)
  href = topicref.attributes['href']
  scope = topicref.attributes['scope']
  text = nav_title(topicref, base_dir)

  link = if scope == 'external'
           href
         else
           convert_href(href)
         end

  {'text' => text, 'link' => link}
end

def child_topicrefs(element)
  element.elements.to_a('topicref')
end

sidebar = []

doc.root.each_element do |el|
  case el.name
  when 'topichead'
    group = {
      'text' => el.attributes['navtitle'],
      'items' => child_topicrefs(el).map { |ref| make_item(ref, base_dir) }
    }
    sidebar << group
  when 'topicref'
    children = child_topicrefs(el)
    if children.empty?
      sidebar << make_item(el, base_dir)
    else
      group = {
        'text' => nav_title(el, base_dir),
        'items' => [make_item(el, base_dir)] +
                   children.map { |ref| make_item(ref, base_dir) }
      }
      sidebar << group
    end
  end
end

puts sidebar.to_yaml
