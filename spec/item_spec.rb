require 'spec_helper'

describe Item do

  let(:name) { 'Test Item' }
  let(:sell_in) { 5 }
  let(:quality) { 10 }
  subject { Item.new(name, sell_in, quality) }

  describe '#initialize' do
    its(:name) { should == name }
    its(:sell_in) { should == sell_in }
    its(:quality) { should == quality }
  end

  describe '#expired?' do

    context 'by default' do
      its(:expired?) { should be_false }
    end

    context 'when past its expiration date' do
      let(:sell_in) { -1 }
      its(:expired?) { should be_true }
    end

  end

end

