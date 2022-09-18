#puts "Qual é o seu nome?:"
#nome = gets.chomp

puts "Digite sua nota:"
nota = gets.chomp.to_i

nota = 78  
if nota  < 50   
  puts "Student is failed"  
   
elsif nota >= 50 && nota <= 60   
  puts "Student gets D grade"  
   
elsif nota >= 70 && nota <= 80   
  puts "Student gets B grade" 
    
elsif nota >= 80 && nota <= 90   
  puts "Student gets A grade" 
     
elsif nota >= 90 && nota <= 100   
  puts "Student gets A+ grade"    
end

#puts "Hello #{nome}, você tem #{idade} anos!"