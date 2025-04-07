require 'json'
require_relative 'my_list_modification'

filename = 'todo.json'

begin
  my_list = JSON.parse(File.read(filename))
rescue
  my_list = []
end

puts "What would you like to do
 (a-> to add a new list):
 (r-> to remove from the list:)
 (ll-> to remove from the list:)  "

cmd = gets.chomp.strip
case cmd
when "a"
  add_a_task(my_list, cmd, filename)
when "r"
  delete(my_list, cmd, filename)
when "ll"
  index = 1
  puts "Your todo list: "
  my_list.each do |chore|
    puts "#{index}. #{chore}"
    index += 1
  end

else
  puts "Unknown command.please try again."
end


