my_list = []
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

when "r"
  puts "Ajouter supprimé."

else
  puts "Commande inconnue."
end



