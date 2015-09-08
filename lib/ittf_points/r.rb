module IttfPoints
  module R
    class << self
      def r1_expected
        win = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]
        lose = [*0..9]
        [win, lose]
      end

      def r1_unexpected
        win = [20, 24, 28, 32, 40, 48, 56, 64, 72, 80]
        lose = [10, 12, 14, 16, 20, 24, 28, 32, 36, 40]
        [win, lose]
      end

      def r2_expected
        win = [0, 2, 3, 5, 6, 8, 9, 11, 12, 14]
        lose = [0, 1, 2, 3, 3, 4, 5, 6, 6, 7]
        [win, lose]
      end

      def r2_unexpected
        win = [15, 18, 21, 24, 30, 36, 42, 48, 54, 60]
        lose = [8, 9, 11, 12, 15, 18, 21, 24, 27, 30]
        [win, lose]
      end

      def r3_expected
        win = [*0..9]
        lose = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5]
        [win, lose]
      end

      def r3_unexpected
        win = [10, 12, 14, 16, 20, 24, 28, 32, 36, 40]
        lose = [5, 6, 7, 8, 10, 12, 14, 16, 18, 20]
        [win, lose]
      end
    end
  end
end
