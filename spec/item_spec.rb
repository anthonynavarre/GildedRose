describe Item do

  describe '#initialize' do
    let(:name) { 'Test Item' }
    let(:sell_in) { 5 }
    let(:quality) { 10 }
    subject { Item.new(name, sell_in, quality) }

    its(:name) { should == name }
    its(:sell_in) { should == sell_in }
    its(:quality) { should == quality }
  end

end

