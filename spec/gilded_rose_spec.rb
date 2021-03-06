require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context "Generic item" do

      it "does not change the name" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "foo"
      end

      it "All items have a sell_in date which decreases by 1 each day" do
        items = [Item.new("item", 6, 25)]
        GildedRose.new(items).update_quality()
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (4)
      end

      it "item has quality value which decreases each day" do
        items = [Item.new("item", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (9)
      end

      it "item has quality value which is never negative" do
        items = [Item.new("item", 10, 0)]
        GildedRose.new(items).update_quality()
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (0)
      end

      it "item has quality value which decreases by 2 each day after sell_in date" do
        items = [Item.new("item", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (8)
      end
    end

    context "Conjured items" do
      it "item quality decreases twice as fast as normal items" do
        items = [Item.new("Conjured", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (8)
      end

      it "item quality decreases twice as fast as normal items after sell_in date" do
        items = [Item.new("Conjured", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (6)        
      end
    end
  
    context "Aged Brie" do

      it "item quality is never more than 50" do
        items = [Item.new("Aged Brie", 6, 50)]
        GildedRose.new(items).update_quality()
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (50)
      end

      it "increases in quality by 1 up to sell_in date" do
        items = [Item.new("Aged Brie", 1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (11)
      end

      it "increases in quality by 2 after sell_in date" do
        items = [Item.new("Aged Brie", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (12)
      end
    end

    context "Backstage passes to a TAFKAL80ETC concert" do

      it "increases in quality up to the sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (12)
      end

      it "increases in quality by 2 when sell_in 10 days or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (12)
      end

      it "increases in quality by 3 when sell_in 5 days or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (13)
      end

      it "Quality value is 0 after sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq (0)
      end

    end  

    context "Sulfuras, Hand of Ragnaros" do

      it "never decreases in quality from 80" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 2, 10)]
          GildedRose.new(items).update_quality()
          GildedRose.new(items).update_quality()
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq (80)
      end

      it "sell_in date never decreases" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        GildedRose.new(items).update_quality()
        GildedRose.new(items).update_quality()
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (5)
      end
    end
  end
        


end


