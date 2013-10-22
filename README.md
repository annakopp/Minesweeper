#Minesweeper

A command line [minesweeper][1] game written in Ruby. The game supports two grid sizes. There are 10 randomly placed mines on the 9x9 board and 40 mines on the 16x16 board.

Each turn, the player chooses an action (R for reveal, F for flag) and a coordinate (e.g. "F00" will place a flag in the top left corner of the board). Squares without any surrounding bombs are automatically revealed. The game ends when all spaces have been either revealed or flagged.

####Saving and High Scores

When a player wins, their final time is added to "scoreboard.txt." A game can be saved by typing "S." YAML serialization is used to save the current game state to a text file.

  [1]: https://en.wikipedia.org/wiki/Minesweeper_(Windows)
