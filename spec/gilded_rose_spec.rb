require 'spec_helper'

describe GildedRose do

  describe '#update_quality' do
    let(:name) { 'generic' }
    let(:sell_in) { 10 }
    let(:quality) { 5 }
    let(:item) { DepreciatingItem.new(name, sell_in, quality) }

    subject { GildedRose.new }

    before { subject.instance_variable_set(:@items, [item]) }

    context 'for a generic item' do
      it 'decrements the quality and sell_in values for its items' do
        subject.update_quality
        item.sell_in.should == sell_in - 1
        item.quality.should == quality - 1
      end
    end

    context 'for an item that is past its expiration date' do
      let(:sell_in) { -1 }
      let(:quality) { 4 }
      it 'decrements the quality twice as fast' do
        subject.update_quality
        item.sell_in.should == sell_in - 1
        item.quality.should == quality - 2
      end
    end

    context 'when the item quality is reduced to 0' do
      let(:quality) { 0 }
      it 'never reduces the quality of an item to below 0' do
        subject.update_quality
        item.quality.should == 0
        item.sell_in.should == sell_in - 1
      end
    end

    context 'when dealing with an item that increases in quality over time' do
      let(:name) { 'Aged Brie' }
      let(:quality) { 15 }
      let(:sell_in) { 5 }
      let(:item) { AppreciatingItem.new(name, sell_in, quality) }

      before { subject.update_quality }

      it 'increases in quality over time' do
        item.quality.should == quality + 1
        item.sell_in.should == sell_in - 1
      end

      context 'when the quality is at maximum' do
        let(:quality) { 50 }
        it 'never increases to a quality over 50' do
          item.quality.should == 50
          item.sell_in.should == sell_in - 1
        end
      end

      context 'when dealing with an item with a variable-rate of quality change' do
        let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }
        let(:quality) { 45 }
        let(:item) { EventSpecificItem.new(name, sell_in, quality) }

        context "when nearing the item's expiration date" do
          let(:sell_in) { 9 }
          it 'increases in quality twice as quickly' do
            item.quality.should == quality + 2
            item.sell_in.should == sell_in - 1
          end
        end

        context "when the item's expiration date draws nigh" do
          let(:sell_in) { 4 }
          it 'increases in quality three times as quickly' do
            item.quality.should == quality + 3
            item.sell_in.should == sell_in - 1
          end
        end

        context 'after the item has expired' do
          let(:sell_in) { 0 }
          it 'drops the item quality to 0' do
            item.quality.should == 0
            item.sell_in.should == sell_in - 1
          end
        end
      end

    end

    context 'when dealing with a "legendary" item' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:item) { LegendaryItem.new(name, sell_in, quality) }

      before { subject.update_quality }

      it 'does not affect the item' do
        item.quality.should == quality
        item.sell_in.should == sell_in
      end
    end

    context 'when dealing with a "conjured" item' do
      let(:name) { 'Conjured Mana Cake' }
      let(:item) { ConjuredItem.new(name, sell_in, quality) }

      before { subject.update_quality }

      it 'drops the items quality twice as quickly' do
        item.quality.should == quality - 2
        item.sell_in.should == sell_in - 1
      end
    end

  end

end

