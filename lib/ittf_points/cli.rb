require 'thor'

module IttfPoints
  class CLI < Thor
    desc 'player RATING_POINTS', 'Show new rating points'
    method_option :win, aliases: '-w', type: :array
    method_option :lose, aliases: '-l', type: :array
    def player(points, weight = :W2)
      player = Player.new(rating_points: points, weight: weight)
      if options[:win]
        player.win(options[:win])
      end
      if options[:lose]
        player.lose(options[:lose])
      end
      puts "New Added Rating Points: #{player.new_added_rating_points}"
      puts "New Rating Points: #{player.new_rating_points}"
    end
  end
end
