input text = Hi there, My name is Valeness and I'll be your guide.
 
 
Source                       Target
--------------------------|------------------------
Hello, my name is Michael => Hola! Me llamo es Michael
 
group 1: Hello, my name is Michael
group 2: Hello, my name is
group 3: Hello, my name
group 4: Hello, my
group 5: Hello
 
group 6: my name is Michael
group 7: my name is
group 8: my name
group 9: my
 
group 10: name is Michael
group 11: name is
group 12: name
 
group 13: is Michael
group 14: is
 
group 15: Michael
 
 
Now let's look for matches:
 
group 1: Hello, my name is Michael  | Hola! Me llamo es Michael
group 2: Hello, my name is          | Hola! Me llamo es
group 3: Hello, my name             | hola, me llamo
group 4: Hello, my                  | hola, me
group 5: Hello                      | Hola
 
group 6: my name is Michael         | Me llamo es Michael
group 7: my name is                 | Me llamo es
group 8: my name                    | Me llamo
group 9: my                         | Me
 
group 10: name is Michael           | llamo es Michael
group 11: name is                   | llamo es
group 12: name                      | llamo
 
group 13: is Michael                | es Michael
group 14: is                        | es
 
group 15: Michael                   | Michael   <--- this would never need to be in the DB
 
Now lets compare the source data:
group 1: Hi there, My name is Valeness and I'll be your guide. |
group 2: Hi there, My name is Valeness and I'll be your
group 3: Hi there, My name is Valeness and I'll be
group 4: Hi there, My name is Valeness and I'll
group 5: Hi there, My name is Valeness and
group 6: Hi there, My name is Valeness
group 7: Hi there, My name is
group 8: Hi there, My name
group 9: Hi there, My ..etc.
 
So...
group X where source data = "My name is" translates to "Me llamo es"
group y where source data = "and I'll" translates to "y yo esta" (from another part of the TM not shown)
group z where source data = "Hi there," translates to "Hola" (from another part of the TM not shown)
 
So if we combine these we can fuzzy match:
Hola, Me llamo es Valeness y yo esta your guide
 
8/10 words match, 80% fuzzy match.
Translator picks up this match and fixes "your guide" to be "su director" or something.
 
"your guide" = "su director" is then put into the TM for later matching.
 
But "su director" fuzzy matches against "your guide book" on a 66% (well below threshold but still, this is jsut to show the issue)
 
So "Here is your guide book" becomes "Esta su director biblio" or something like that due to fragments being translated as such.
 
That's not "REALLY" how it works, but it's kind of the idea. Since you translate fragments at a 100% match, any other fragmentation will be translated at a 100% match causing weird contextual issues and mistranslation
