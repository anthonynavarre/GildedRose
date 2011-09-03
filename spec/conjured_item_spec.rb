require 'spec_helper'

describe ConjuredItem do

  describe '#age' do
    let(:sell_in) { 10 }
    let(:quality) { 15 }
    subject { ConjuredItem.new('Conjured Mana Cake', sell_in, quality) }
    before { subject.age }

    its(:sell_in) { should == sell_in - 1 }
    its(:quality) { should == quality - 2 }
  end

end

