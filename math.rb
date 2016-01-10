@p1_lives = 3
@p2_lives = 3
@game_run = true

def reset_lives
  @p1_lives = 3
  @p2_lives = 3
  @game_run = true
end

def p1
  puts "Player 1's turn (#{@p1_lives} lives left)"
end

def p2 
  puts "Player 2's turn (#{@p2_lives} lives left)"
end

def generate_question
  @num1 = rand(1..20)
  @num2 = rand(1..20)
end

def question_prompt
  puts "What is #{@num1} + #{@num2} ?"
end

def prompt_player_answer
  @input = gets.chomp.to_i
end

def lose_life_p1
  @p1_lives -= 1
end

def lose_life_p2
  @p2_lives -= 1
end

def verify_answer_p1
  if @input == @num1 + @num2
    puts "Correct. Lives remaining #{@p1_lives}"
  else
    lose_life_p1
    puts "Wrong. Lives remaining #{@p1_lives}"
  end
end

def verify_answer_p2
  if @input == @num1 + @num2
    puts "Correct. Lives remaining #{@p2_lives}"
  else
    lose_life_p2
    puts "Wrong. Lives remaining #{@p2_lives}"
  end
end

def start_p1
  p1
  generate_question
  question_prompt
  prompt_player_answer
  verify_answer_p1
  p2_wins
  start_p2
end

def start_p2
  p2
  generate_question
  question_prompt
  prompt_player_answer
  verify_answer_p2
  p1_wins
  start_p1
end

def p1_wins
  if (@p2_lives) == 0
   puts "Player 1 is the winner!"
   play_again
  end
end

def p2_wins
  if (@p1_lives) == 0
   puts "Player 2 is the winner!"
   play_again
  end
end

def play_again
  puts "Would you like to play again?"
  while @game_run
    @input = gets.chomp
    @check = @input
    if @check == 'yes'
      reset_lives
      start_p1
    elsif @check == 'no'
      game_end
    elsif @check == 'quit'
      game_end
    else 
      puts "Please enter yes, no or quit."
    end
  end  
end

def quit
  puts "Please enter yes, no or quit."
end

def game_end
  exit
end

while @game_run
  start_p1
end

# i = gets.chomp
# puts i.include?("k")



# def start
# generate_question
# prompt_player_answer
# verify_answer
# minus_life
# print correct and incorrect answers
# @player_turn = 
# generate_question for player2
# end

#loop until input == 'quit'


