# Gilded Rose Refactoring Kata
### Technologies: Ruby, Rspec

## Index
* [Project Direction](#Project)
* [Installation](#Install)
* [Rspec Tests](#Rspec)
* [Usage](#Usage)


## Gilded Rose Requirements Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

## <a name="Project">Project Direction</a>
I started this tech test by writing tests to see if the code executed everything on the requirements specification. All the tests passed therefore I knew that the code was working. Because of all the if and else statements I couldn't follow the code logic, so I began rewriting the code. I separated the items into if statements and put the value adjustments into ternary operators. By doing this I distilled the code and made it easier to read by item and behaviour.


## <a name="Install">Installation</a>
* To clone the repo
```shell
$ git clone https://github.com/lroberts77/GildedRose-Refactoring-Kata
$ cd GildedRose-Refactoring-Kata
$ bundle
```

## <a name="Rspec">Rspec Tests</a>
```shell
$ cd GildedRose-Refactoring-Kata
$ rspec
```

## <a name="Usage">Usage</a>
in the terminal
```ruby
$ ruby irb.rb

- 'Change Item.new three parameters to see how the values of different items change after a day'
$ items = [Item.new("item", 6, 25)]

- 'this will return the items adjusted parameters after a simulated day'
$ GildedRose.new(items).update_quality() 


'For indidvidual values use:'

- 'For days until sell by date:'
$ items[0].sell_in 

- 'For item quality value:'
$ items[0].quality

- 'For item name:'
$ items[0].name
```