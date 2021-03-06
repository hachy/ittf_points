module IttfPoints
  class Player
    attr_reader :gained_rating_points, :lost_rating_points, :points_difference
    attr_accessor :weight

    def initialize(rating_points: nil, weight: :r2)
      @rating_points = rating_points.to_i
      @weight = weight.downcase.to_sym
    end

    def win(*rating_points)
      @winner_flag = true
      rating_points.flatten.each do |points|
        @opponent_rating_pts = points.to_i
        expected_or_unexpected(winner: @rating_points, loser: @opponent_rating_pts)
      end
      self
    end

    def lose(*rating_points)
      @winner_flag = false
      rating_points.flatten.each do |points|
        @opponent_rating_pts = points.to_i
        expected_or_unexpected(winner: @opponent_rating_pts, loser: @rating_points)
      end
      self
    end

    def new_added_rating_points
      if defined?(@gained_rating_points)
        gained = @gained_rating_points.inject(:+)
      else
        gained = 0
      end

      if defined?(@lost_rating_points)
        lost = @lost_rating_points.inject(:+)
      else
        lost = 0
      end
      gained - lost
    end

    def new_rating_points
      new_added_rating_points + @rating_points
    end

    def weighting(weight)
      @weight = weight.downcase.to_sym
      self
    end

    private

    def expected_or_unexpected(winner: nil, loser: nil)
      if winner > loser
        weight_ary = R.__send__("#{@weight}_expected")
        @winners_pts_ary, @losers_pts_ary = weight_ary
        expected
      else
        weight_ary = R.__send__("#{@weight}_unexpected")
        @winners_pts_ary, @losers_pts_ary = weight_ary
        unexpected
      end
    end

    def expected
      case pts_diff
      when 0..25    then results(9)
      when 26..50   then results(8)
      when 51..100  then results(7)
      when 101..150 then results(6)
      when 151..200 then results(5)
      when 201..300 then results(4)
      when 301..400 then results(3)
      when 401..500 then results(2)
      when 501..750 then results(1)
      when 751..Float::INFINITY then results(0)
      end
    end

    def unexpected
      case pts_diff
      when 0..24    then results(0)
      when 25..49   then results(1)
      when 50..99   then results(2)
      when 101..150 then results(3)
      when 150..199 then results(4)
      when 200..299 then results(5)
      when 300..399 then results(6)
      when 400..499 then results(7)
      when 500..749 then results(8)
      when 750..Float::INFINITY then results(9)
      end
    end

    def pts_diff
      diff = @rating_points - @opponent_rating_pts
      (@points_difference ||= []) << diff.abs
      diff.abs
    end

    def results(idx)
      if @winner_flag
        (@gained_rating_points ||= []) << @winners_pts_ary[idx]
      else
        (@lost_rating_points ||= []) << @losers_pts_ary[idx]
      end
    end
  end
end
