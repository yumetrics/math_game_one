# @p1_lives = 3
# @p2_lives = 3
# @game_run = true
require 'colorize'

class Player

  attr_reader(:name, :lives, :points)
  attr_writer(:lives, :points)

  def initialize(name, lives=3, points=0)
    @name = name
    @lives = lives
    @points = points
  end

  def reset
    @points = 0
    @lives = 3
  end

  def add_point
    @points += 1
  end

  def lose_life
    @lives -= 1
  end

end

class Question

  attr_accessor(:answer)

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @randomizer = rand(1..3)

      if @randomizer == 1
        @answer = @num1 + @num2
        @manip = '+'
      elsif @randomizer == 2
        @answer = @num1 - @num2
        @manip = '-'
      elsif @randomizer == 3
        @answer = @num1 * @num2
        @manip = '*'
      end
  end

  # def manip_prompt
  #   puts "What type of questions would you like?"
  # end

  # def manip
  #   if @input == '+' || 'addition'
  #    @manip = '+'
  #   elsif @input == '-' || 'subtraction'
  #    @manip = '-'
  #   elsif @input == '*' || 'multiplication'
  #    @manip = '*'
  #   end
  # end

  def prompt
    puts "What's #{@num1} #{@manip} #{@num2}?"
  end

  def verify(input)
    input == @answer
  end

end

def end_game
  puts "Thanks for playing!"
  exit
end

def play_again
  
end

@turn = 1
@game_run = true

puts "Would you like to play a game? 'yes' or 'no'" "\n"
while @game_run
  @input = gets.chomp
  if @input == 'yes'

  puts "Great, lets get started!"

  print "Player 1's name is?: "
  name = gets.chomp
  p1 = Player.new(name)

  print "Player 2's name is?: "
  name = gets.chomp
  p2 = Player.new(name)

  @question_time = true

    while @question_time

      question = Question.new

      if @turn == 1
        puts
        puts "#{p1.name}".magenta
      elsif @turn == 2
        puts
        puts "#{p2.name}".cyan
      end

      puts question.prompt

      @input = gets.chomp.to_i

      if @turn == 1 && question.verify(@input)
        p1.add_point
        puts "Well done #{p1.name}! You gained a point!".green
        @turn += 1
      elsif @turn == 1 && question.verify(@input) == false
        p1.lose_life
        puts "Incorrect #{p1.name}. You lost a life.".red
        @turn += 1
      elsif @turn == 2 && question.verify(@input)
        p2.add_point
        puts "Well done #{p2.name}! You gained a point!".green
        @turn -= 1
      elsif @turn == 2 && question.verify(@input) == false
        p2.lose_life
        puts "Incorrect #{p2.name}. You lost a life.".red
        @turn -= 1
      end

      if (p1.lives == 0 || p2.lives == 0)
        if p1.lives == 0
          puts "#{p2.name} wins!"
          puts
          puts "Total points: "
          puts
          puts "#{p1.name} earned #{p1.points} points!".blue
          puts "#{p2.name} earned #{p2.points} points!".blue
        elsif p2.lives == 0
          puts "#{p1.name} wins!"
          puts
          puts "Total points: "
          puts
          puts "#{p1.name} earned #{p1.points} points!".blue
          puts "#{p2.name} earned #{p2.points} points!".blue
        end

      puts
      puts "Would you like to play again?"
      @conclusion = true
        while @conclusion
          @input = gets.chomp
          if @input == 'yes'
            p1.reset
            p2.reset
            puts
            puts "Players points and lives have been reset!"
            @conclusion = false
          elsif @input == 'no'
            puts 'Thanks for playing!'
            exit
          else
            puts "Please enter 'yes' or 'no'"
          end
        end
      end
    end

 
elsif @input == 'no'
  puts "Maybe another time!"
  exit
else 
  puts "Type 'yes' or 'no' "
end
end
# def reset_lives
#   @p1_lives = 3
#   @p2_lives = 3
#   @game_run = true
# end

# def p1
#   puts "Player 1's turn (#{@p1_lives} lives left)"
# end

# def p2 
#   puts "Player 2's turn (#{@p2_lives} lives left)"
# end

# def generate_question
#   @num1 = rand(1..20)
#   @num2 = rand(1..20)
# end

# def question_prompt
#   puts "What is #{@num1} + #{@num2} ?"
# end

# def prompt_player_answer
#   @input = gets.chomp.to_i
# end

# def lose_life_p1
#   @p1_lives -= 1
# end

# def lose_life_p2
#   @p2_lives -= 1
# end

# def verify_answer_p1
#   if @input == @num1 + @num2
#     puts "Correct. Lives remaining #{@p1_lives}"
#   else
#     lose_life_p1
#     puts "Wrong. Lives remaining #{@p1_lives}"
#   end
# end

# def verify_answer_p2
#   if @input == @num1 + @num2
#     puts "Correct. Lives remaining #{@p2_lives}"
#   else
#     lose_life_p2
#     puts "Wrong. Lives remaining #{@p2_lives}"
#   end
# end

# def start_p1
#   p1
#   generate_question
#   question_prompt
#   prompt_player_answer
#   verify_answer_p1
#   p2_wins
#   start_p2
# end

# def start_p2
#   p2
#   generate_question
#   question_prompt
#   prompt_player_answer
#   verify_answer_p2
#   p1_wins
#   start_p1
# end

# def p1_wins
#   if (@p2_lives) == 0
#    puts "Player 1 is the winner!"
#    play_again
#   end
# end

# def p2_wins
#   if (@p1_lives) == 0
#    puts "Player 2 is the winner!"
#    play_again
#   end
# end

# def play_again
#   puts "Would you like to play again?"
#   while @game_run
#     @input = gets.chomp
#     @check = @input
#     if @check == 'yes'
#       reset_lives
#       start_p1
#     elsif @check == 'no'
#       game_end
#     elsif @check == 'quit'
#       game_end
#     else 
#       puts "Please enter yes, no or quit."
#     end
#   end  
# end

# def game_end
#   exit
# end

# while @game_run
#   start_p1
# end

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


