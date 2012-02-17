#!/usr/bin/ruby -w

require 'rubygems'
require 'bluecloth'

NAME = 'François Hodierne'
INPUT = "README.md"
OUTPUT = "resume.html"
TEMPLATE = "template.html"

date = Time.now.strftime("%d/%m/%Y")
txt = File.new(INPUT, "r").read
template = File.new(TEMPLATE, "r").read
html = BlueCloth::new(txt).to_html
page = template.gsub('{BODY}', html).gsub('{NAME}', NAME).gsub('{OUTPUT}', OUTPUT).gsub('{DATE}', date);

File.open(OUTPUT, 'w') {|f| f.write(page) }
