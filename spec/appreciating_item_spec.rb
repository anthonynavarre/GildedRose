require 'spec_helper'

describe AppreciatingItem do

  describe '#age' do
    let(:name) { 'Test Item' }
    let(:sell_in) { 5 }
    let(:quality) { 10 }
    subject { AppreciatingItem.new(name, sell_in, quality) }

    before { subject.age }

    context 'by default' do
      its(:quality) { should == quality + 1 }
    end

    context 'when at maximum quality' do
      let(:quality) { Item::MAXIMUM_QUALITY }
      its(:quality) { should == Item::MAXIMUM_QUALITY }
    end
  end

end

