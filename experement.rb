require 'rubygems'
require 'nokogiri'
require 'mechanize'

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
} # содержит инфу о куки, сессиях и др.
page = agent.get 'http://vk.com/'
form = page.forms.first # первая форма, которая встретится на странице

puts form.inspect

form.email = 'sterjakov@mail.ru'
form.pass = 'Qwe95450!'
page = agent.submit form
puts page.inspect