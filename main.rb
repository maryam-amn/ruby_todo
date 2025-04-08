require 'json'
require 'date'
require_relative 'my_list_edit'
require_relative 'task_status'

filename = 'todo.json'
begin
  my_list = JSON.parse(File.read(filename))
rescue
  my_list = []
end
puts "What would you like to do :
1. Add a task.
2. Delete a task.
3. Display the list.
4. Update (done).
5. Update (undone).
6. add a due date.
7. Sort the list."
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
when "6"
  add_date(my_list, cmd, filename)
else
  puts "Unknown command.please try again."
end



