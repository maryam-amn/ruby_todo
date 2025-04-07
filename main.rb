require 'json'
require_relative 'my_list_modification'
require_relative 'todos_status'
filename = 'todo.json'

begin
  my_list = JSON.parse(File.read(filename))
rescue
  my_list = []
end
puts "What would you like to do :
1. Add item
2. Delete
3. Display the list (done)
4. Update (done)
5. Update (undone)"

cmd = gets.chomp.strip
case cmd
when "1"
  add_a_task(my_list, cmd, filename)
when "2"
  delete_a_task(my_list, cmd, filename)
when "3"
  display_list(my_list)
when "4"
  done_undone(my_list, filename, 'done',cmd)
when "5"
  done_undone(my_list, filename, 'undone', cmd)

else
  puts "Unknown command.please try again."
end


