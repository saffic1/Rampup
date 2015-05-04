class Tic

  def initialize
    
    @columns = [      
      [:a1,:a2,:a3],
      [:b1,:b2,:b3],
      [:c1,:c2,:c3],
      
      [:a1,:b1,:c1],
      [:a2,:b2,:c2],
      [:a3,:b3,:c3],
      
      [:a1,:b2,:c3],
      [:c1,:b2,:a3]
    ]
    
    @cpu = rand() > 0.5 ? 'X' : 'O'
    @user = @cpu == 'X' ? 'O' : 'X'
    
    @cpu_name = "Ruby"
    put_line
    puts "\n  RUBY TIC TAC TOE"
    print "\n What is your name? "
    @user_name = gets.chomp
    put_bar

    @user_score = 0
    @cpu_score = 0
    
    start_game(@user == 'X')
  end

  def start_game(user_goes_first)
    
    @places = {
      a1:" ",a2:" ",a3:" ",
      b1:" ",b2:" ",b3:" ",
      c1:" ",c2:" ",c3:" "
    }

    if user_goes_first
      user_turn
    else
      cpu_turn
    end
  end

  def restart_game(user_goes_first)
    (1...20).each { |i| put_line }
    start_game(user_goes_first)
  end
  
  def put_line
    puts ("-" * 80)
  end
  
  def put_bar
    puts ("#" * 80)
    puts ("#" * 80)
  end
  
  def draw_game
    puts ""
    puts " Wins: #{@cpu_name}:#{@cpu_score} #{@user_name}:#{@user_score}"
    puts ""
    puts " #{@cpu_name}: #{@cpu}"
    puts " #{@user_name}: #{@user}"
    puts ""
    puts "     a   b   c"
    puts ""
    puts " 1   #{@places[:a1]} | #{@places[:b1]} | #{@places[:c1]} "
    puts "    --- --- ---"
    puts " 2   #{@places[:a2]} | #{@places[:b2]} | #{@places[:c2]} "
    puts "    --- --- ---"
    puts " 3   #{@places[:a3]} | #{@places[:b3]} | #{@places[:c3]} "
  end
  
  def cpu_turn
    move = cpu_find_move
    @places[move] = @cpu
    put_line
    puts " #{@cpu_name} marks #{move.to_s.upcase}"
    check_game(@user)
  end
  
  def cpu_find_move

    
    @columns.each do |column|
      if times_in_column(column, @cpu) == 2
        return empty_in_column column
      end
    end
    
    
    @columns.each do |column|
      if times_in_column(column, @user) == 2
        return empty_in_column column
      end
    end
    
    
    @columns.each do |column|
      if times_in_column(column, @cpu) == 1
        return empty_in_column column
      end
    end
    
    
    k = @places.keys;
    i = rand(k.length)
    if @places[k[i]] == " "
      return k[i]
    else
      
      @places.each { |k,v| return k if v == " " }
    end
  end
  
  def times_in_column arr, item
    times = 0
    arr.each do |i| 
      times += 1 if @places[i] == item
      unless @places[i] == item || @places[i] == " "
        
        return 0
      end
    end
    times
  end
  
  def empty_in_column arr
    arr.each do |i| 
      if @places[i] == " "
        return i
      end
    end
  end
  
  def user_turn
    put_line
    puts "\n  RUBY TIC TAC TOE"
    draw_game
    print "\n #{@user_name}, please make a move or type 'exit' to quit: "
    input = gets.chomp.downcase.to_sym
    put_bar
    if input.length == 2
      a = input.to_s.split("")
      if(['a','b','c'].include? a[0])
        if(['1','2','3'].include? a[1])
          if @places[input] == " "
            @places[input] = @user
            put_line
            puts " #{@user_name} marks #{input.to_s.upcase}"
            check_game(@cpu)
          else
            wrong_move
          end
        else
          wrong_input
        end
      else
        wrong_input
      end
    else
      wrong_input unless input == :exit
    end
  end
  
  def wrong_input
    put_line
    puts " Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
    user_turn
  end
  
  def wrong_move
    put_line
    puts " You must choose an empty slot"
    user_turn
  end
  
  def moves_left
    @places.values.select{ |v| v == " " }.length
  end
  
  def check_game(next_turn)
  
    game_over = nil
    
    @columns.each do |column|
      
      if times_in_column(column, @cpu) == 3
        put_line
        draw_game
        put_line
        puts ""
        puts " Game Over -- #{@cpu_name} WINS!!!\n"
        game_over = true
        @cpu_score += 1
        ask_to_play_again(false)
      end
      
      if times_in_column(column, @user) == 3
        put_line
        draw_game
        put_line
        puts ""
        puts " Game Over -- #{@user_name} WINS!!!\n"
        game_over = true
        @user_score += 1
        ask_to_play_again(true)
      end
    end
    
    unless game_over
      if(moves_left > 0)
        if(next_turn == @user)
          user_turn
        else
          cpu_turn
        end
      else
        put_line
        draw_game
        put_line
        puts ""
        puts " Game Over -- DRAW!\n"
        ask_to_play_again(rand() > 0.5)
      end
    end
  end

  def ask_to_play_again(user_goes_first)
    print " Play again? (Yn): "
    STDOUT.flush
    response = gets.chomp.downcase
    case response
    when "y"   then restart_game(user_goes_first)
    when "yes" then restart_game(user_goes_first)
    when "n"   then 
    when "no"  then 
    else ask_to_play_again(user_goes_first)
    end
  end
  
end

Tic.new