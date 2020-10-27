require './lib/actions'

RSpec.describe Actions do
  describe 'Actions' do
    stats = {
      'health' => 70,
      'mana' => 10,
      'fun' => -10,
      'tire' => 25,
      'money' => 2500
    }

    context 'work' do
      expected = {
        'health' => 70,
        'mana' => -20,
        'fun' => -15,
        'tire' => 95,
        'money' => 2600
      }
      it { expect(Actions.work(stats.clone)).to eq expected }
    end
    context 'nature' do
      expected = {
        'health' => 70,
        'mana' => 0,
        'fun' => -9,
        'tire' => 35,
        'money' => 2500
      }
      it { expect(Actions.nature(stats.clone)).to eq expected }
    end
    context 'relax_at_home' do
      expected = {
        'health' => 65,
        'mana' => 40,
        'fun' => -11,
        'tire' => 35,
        'money' => 2480
      }
      it { expect(Actions.relax_at_home(stats.clone)).to eq expected }
    end
    context 'relax_in_bar' do
      expected = {
        'health' => 60,
        'mana' => 70,
        'fun' => -9,
        'tire' => 65,
        'money' => 2400
      }
      it { expect(Actions.relax_in_bar(stats.clone)).to eq expected }
    end
    context 'drink_with_marginals' do
      expected = {
        'health' => -10,
        'mana' => 100,
        'fun' => -5,
        'tire' => 105,
        'money' => 2350
      }
      it { expect(Actions.drink_with_marginals(stats.clone)).to eq expected }
    end
    context 'sing_in_metro' do
      expected = {
        'health' => 70,
        'mana' => 20,
        'fun' => -9,
        'tire' => 45,
        'money' => 2510
      }
      it { expect(Actions.sing_in_metro(stats.clone)).to eq expected }
    end
    context 'sleep' do
      expected = {
        'health' => 160,
        'mana' => -40,
        'fun' => -10,
        'tire' => -45,
        'money' => 2500
      }
      it { expect(Actions.go_to_sleep(stats.clone)).to eq expected }
    end
  end
end
