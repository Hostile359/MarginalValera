require './lib/game_process'

RSpec.describe GameProcess do
  describe '#GameProcess' do
    context 'check_action' do
      game = GameProcess.new
      stats = {
        'health' => 70,
        'mana' => 10,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(game.check_action(stats)).to eq false }
    end

    context 'do_action' do
      game = GameProcess.new
      expected_stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => -5,
        'tire' => 70,
        'money' => 100
      }
      game.action_item = 1
      it { expect(game.do_action.stats).to eq expected_stats }
    end
  end
end
