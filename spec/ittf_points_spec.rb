require 'spec_helper'

describe IttfPoints do
  # cf. 9/2015 Ito Mima
  let(:player) { IttfPoints::Player.new(rating_points: 2572, weight: :R2) }

  context 'when player won' do
    before do
      player.win(1412).win('2029')
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [1160, 543] }
    end

    describe '#gained_rating_points' do
      it { expect(player.gained_rating_points).to eq [0, 2] }
    end

    describe '#lost_rating_points' do
      it { expect(player.lost_rating_points).to be_nil }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq 2 }
    end
  end

  context 'when player lost' do
    before do
      player.lose(2145).lose(2189).lose('2447')
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [427, 383, 125] }
    end

    describe '#gained_rating_points' do
      it { expect(player.gained_rating_points).to be_nil }
    end

    describe '#lost_rating_points' do
      it { expect(player.lost_rating_points).to eq [24, 21, 12] }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq(-57) }
    end
  end

  context 'when player won & lost' do
    before do
      player.
        win(1412, '2029').
        lose([2145, 2189, '2447'])
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [1160, 543, 427, 383, 125] }
    end

    describe '#gained_rating_points' do
      it { expect(player.gained_rating_points).to eq [0, 2] }
    end

    describe '#lost_rating_points' do
      it { expect(player.lost_rating_points).to eq [24, 21, 12] }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq(-55) }
    end

    describe '#new_rating_points' do
      it { expect(player.new_rating_points).to eq 2517 }
    end
  end
end
