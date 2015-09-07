module IttfPoints
  module R
    class << self
      def r1_expected
        win = %w(0 2 4 6 8 10 12 14 16 18).map(&:to_i)
        lose = [*0..9]
        [win, lose]
      end

      def r1_unexpected
        win = %w(20 24 28 32 40 48 56 64 72 80).map(&:to_i)
        lose = %w(10 12 14 16 20 24 28 32 36 40).map(&:to_i)
        [win, lose]
      end

      def r2_expected
        win = %w(0 2 3 5 6 8 9 11 12 14).map(&:to_i)
        lose = %w(0 1 2 3 3 4 5 6 6 7).map(&:to_i)
        [win, lose]
      end

      def r2_unexpected
        win = %w(15 18 21 24 30 36 42 48 54 60).map(&:to_i)
        lose = %w(8 9 11 12 15 18 21 24 27 30).map(&:to_i)
        [win, lose]
      end

      def r3_expected
        win = [*0..9]
        lose = %w(0 1 1 2 2 3 3 4 4 5).map(&:to_i)
        [win, lose]
      end

      def r3_unexpected
        win = %w(10 12 14 16 20 24 28 32 36 40).map(&:to_i)
        lose = %w(5 6 7 8 10 12 14 16 18 20).map(&:to_i)
        [win, lose]
      end
    end
  end
end
