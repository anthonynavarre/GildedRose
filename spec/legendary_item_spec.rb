require 'spec_helper'

describe LegendaryItem do
  let(:name) { 'Test Item' }
  let(:sell_in) { 5 }
  let(:quality) { 10 }
  subject { LegendaryItem.new(name, sell_in, quality) }

  describe '#age' do
    before { subject.age }

    its(:quality) { should == quality }
    its(:sell_in) { should == sell_in }
  end

end

