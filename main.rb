require 'json'

filename = 'todo.json'

begin
  my_list = JSON.parse(File.read(filename))
rescue
  my_list = []
end

puts "What would you like to do
 (a-> to add a new list):
 (r-> to remove a list:)  "

cmd = gets.chomp.strip
case cmd
when "a"
  while cmd
    puts "Enter your todo (enter 'stop' when you finished):"
    task = gets.chop
    if task == "stop"
      break
    else
      my_list.push(task)
    end
  end
  puts "Your to do list  : ", my_list

  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(my_list))
  end

when "r"
  puts "Ajouter supprimé."

else
  puts "Commande inconnue."
end


