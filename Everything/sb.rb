#!/usr/bin/ruby

require "rexml/document"
include REXML

class Project
   attr_reader :url, :prefix, :name
   def initialize(url, prefix)
      @url = url
      @name = url[url.rindex('/')+1 .. url.length]
      if prefix.empty?
         @prefix = name
      else
         @prefix = prefix
      end
   end
   
   def <=> (other)
      return @prefix+@url <=> other.prefix+other.url
   end
end

$projects = Array.new

def sbCreateEntry(url, prefix, name)
   if prefix == "websites" || prefix == "sysadmin" || prefix == "repo-management"
      return
   end
   printf("sb_add_project(%s GIT_REPOSITORY %s SUBDIR %s\n              )\n", name, url, prefix + "_" + name)
end


def sbProcess(element, prefix)
   element.elements.each("repo/url") {|url| $projects.push(Project.new(url.text, prefix)) if url.attributes["protocol"]=="git" }

   if element.attributes["identifier"] != nil then
      prefix = prefix + "_" unless prefix.empty?
      prefix = prefix + element.attributes["identifier"]
   end

   element.elements.each { |sub| sbProcess(sub, prefix) }
end 


file = File.new("kde_projects.xml")

doc = Document.new(file)

sbProcess(doc.root(), "")

$projects.sort!
$projects.each{ |p| sbCreateEntry(p.url, p.prefix, p.name ) }
