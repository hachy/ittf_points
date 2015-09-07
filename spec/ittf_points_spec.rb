require 'spec_helper'

describe IttfPoints do
  # cf. 9/2015
  let(:player) { IttfPoints::Player.new(name: 'Ito Mima', rating_points: 2572, weighting: :R2) }

  context 'when player won' do
    before do
      player.
        win(rating_points: 1412).
        win(name: 'SOO', rating_points: '2029')
    end

    describe '#opponent' do
      it { expect(player.opponent).to eq [nil, 'SOO'] }
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [1160, 543] }
    end

    describe '#gained_points' do
      it { expect(player.gained_points).to eq [0, 2] }
    end

    describe '#lost_points' do
      it { expect(player.lost_points).to be_nil }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq 2 }
    end
  end

  context 'when player lost' do
    before do
      player.
        lose(rating_points: 2145).
        lose(rating_points: 2189).
        lose(name: 'Ishigaki', rating_points: '2447')
    end

    describe '#opponent' do
      it { expect(player.opponent).to eq [nil, nil, 'Ishigaki'] }
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [427, 383, 125] }
    end

    describe '#gained_points' do
      it { expect(player.gained_points).to be_nil }
    end

    describe '#lost_points' do
      it { expect(player.lost_points).to eq [24, 21, 12] }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq(-57) }
    end
  end

  context 'when player won & lost' do
    before do
      player.
        win(rating_points: 1412).
        win(name: 'SOO', rating_points: '2029').
        lose(rating_points: 2145).
        lose(rating_points: 2189).
        lose(name: 'Ishigaki', rating_points: '2447')
    end

    describe '#opponent' do
      it { expect(player.opponent).to eq [nil, 'SOO', nil, nil, 'Ishigaki'] }
    end

    describe '#points_difference' do
      it { expect(player.points_difference).to eq [1160, 543, 427, 383, 125] }
    end

    describe '#gained_points' do
      it { expect(player.gained_points).to eq [0, 2] }
    end

    describe '#lost_points' do
      it { expect(player.lost_points).to eq [24, 21, 12] }
    end

    describe '#new_added_rating_points' do
      it { expect(player.new_added_rating_points).to eq(-55) }
    end

    describe '#new_rating_points' do
      it { expect(player.new_rating_points).to eq 2517 }
    end
  end
end
