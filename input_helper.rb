module InputHelper

  SAFE_WORD = ['QUIT', 'EXIT']

  def prompt(string)
    print(string + "\n> ")
  end

  def gets
    input = Kernel.gets
    if SAFE_WORD.include?(input.chomp.strip.upcase)
      puts 'You quit the game!'
      puts 'Goodbye !!!'
      exit
    end
    input
  end
end
