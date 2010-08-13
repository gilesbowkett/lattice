Lattice
=======

Lattice is a [Drop7](http://areacodeinc.com/drop7/) clone implemented in Ruby. It includes a very minimal console "game" for dev purposes. Drop7 is awesome and you should [buy it](http://click.linksynergy.com/fs-bin/stat?id=t/y4Q7T5vuU&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fdrop7%252Fid299940763%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30). If you don't know Drop7 and you want to try before you buy, or you can't figure out how to play the console version included here, [check the original Web version in Flash](http://www.chainfactor.com/).

Many features are not yet supported. Also, note that by "console game" I mean "console" in the programmer sense, not the gamer sense. It runs on your command line, not an XBox. Although it could in theory run on an XBox if you installed Linux and Ruby on it first.

Tests
-----

Tests are done in test/unit, because it was fast. Console mini-game does not have tests but has reached the point where it should. Block hack in grid.rb (for console mini-game UI) also lacks tests.

Structure
---------

Pretty much all the code lives in the grid, or game board; most of the code works on arrays rather than objects. This was not a conscious decision, and might just be a hangover from writing too much Perl when I was younger. (Ah, the wild days...)

Disclaimer
----------

This project makes no claims as to the awesomeness of its code base. This code may not be awesome.
