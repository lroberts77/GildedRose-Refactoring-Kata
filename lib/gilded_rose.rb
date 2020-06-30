require_relative 'item'
class GildedRose

  MAXIMUMQUALITY = 50
  MINIMUMQUALITY = 0
  MINIMUMSELLIN = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      #Generic item
      if generic_item(item)
         item.sell_in <= MINIMUMSELLIN ? item.quality -= 2 : item.quality -= 1 unless item.quality == MINIMUMQUALITY
      end

      #Conjured items
      if item.name == "Conjured"
         item.sell_in <= MINIMUMSELLIN ? item.quality -= 4 : item.quality -= 2 unless item.quality == MINIMUMQUALITY
      end

      #Aged Brie
      if item.name == "Aged Brie"
         item.sell_in <= MINIMUMSELLIN ? item.quality += 2 : item.quality += 1 unless item.quality == MAXIMUMQUALITY
      end
      
      # Backstage passes to a TAFKAL80ETC concert
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
         item.sell_in <= 5 ? item.quality += 3 : item.quality += 2 unless item.quality == MAXIMUMQUALITY
        if item.sell_in == MINIMUMSELLIN 
           item.quality = MINIMUMQUALITY
        end
      end

      #Sulfuras, Hand of Ragnaros
      if item.name == "Sulfuras, Hand of Ragnaros"
         item.quality = 80
         item.sell_in += 1
      end

      item.sell_in -= 1

    end
  end
end

def generic_item(item)
  item.name != "Aged Brie" && 
  item.name != "Backstage passes to a TAFKAL80ETC concert" &&
  item.name != "Sulfuras, Hand of Ragnaros" &&
  item.name != "Conjured"
end

# THIS IS THE ORIGINAL CODE WHICH I HAVE REFACTORED ABOVE

#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end

#test
#test