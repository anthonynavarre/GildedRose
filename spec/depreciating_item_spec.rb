require 'spec_helper'

describe DepreciatingItem do
  let(:name) { 'Test Item' }
  let(:sell_in) { 5 }
  let(:quality) { 10 }
  subject { DepreciatingItem.new(name, sell_in, quality) }

  describe '#age' do
    before { subject.age }
    its(:sell_in) { should == sell_in - 1 }

    context 'by default' do
      its(:quality) { should == quality - 1 }
    end

    context 'when expired' do
      let(:sell_in) { -1 }
      its(:quality) { should == quality - 2 }
    end
  end

end

