require 'spec_helper'

describe EventSpecificItem do
  let(:name) { 'Test Item' }
  let(:sell_in) { 15 }
  let(:quality) { 10 }
  subject { EventSpecificItem.new(name, sell_in, quality) }

  describe '#age' do
    before { subject.age }

    context 'when expired' do
      let(:sell_in) { -1 }
      its(:quality) { should == 0 }
    end

    context 'by default' do
      its(:quality) { should == quality + 1 }
    end

    context 'when approaching its expiration date' do
      let(:sell_in) { 9 }
      its(:quality) { should == quality + 2 }
    end

    context 'when its expiration date draws nigh' do
      let(:sell_in) { 4 }
      its(:quality) { should == quality + 3 }
    end

  end
end

