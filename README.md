# Pacman in Vimland: Gosu Ghost Goose
## Created by Celeste Morton, Drew Peterson, Lara Bjork, and Michael Wells, February 3-6, 2020

![pac-gif](/media/pacgif.gif)
### Project Description

This project was completed as a team assignment at the conclusion of a seven-week Ruby class at Epicodus.

Our goal was to make learning VIM less intimidating. We chose to develop a game that would help users learn VIM commands.

### Specifications
1. A user should be able to navigate a maze using **h, j, k, l**, which are the VIM commands for left, down, up, and right, respectively.

2. The Pacman can move progress from one level to the next by collecting dots and the bonus cherries.

3. A game ends when the Pacman comes in contact with one of the villains (ghost, goose, or giant Yoshi) or when the player hits either **esc** or **q** to quit the game.

4. There are three levels in total.


### Technologies Used
Ruby 2.6.5, Gosu, Bundler

Project was written using MacOS. No other operating systems were tested.

### Project Setup instructions
All of these commands will be entered in your terminal window.
1. Ensure that you have the correct version of Ruby installed.
2. Install Bundler if you do not already have it by running **gem install bundler** in the terminal.
3. MacOS users: to install Gosu, start by installing **Homebrew** and running **brew install sdl2**. For Windows, Linux, or Raspbarian/Raspberry Pi, see https://github.com/gosu/gosu/wiki
4. Clone the project locally from github (https://github.com/Michael-Wayne-Wells/vim-game.git).
5. Run **gem install gosu**.
6. Run **bundle install** to manage gems; if you make additional changes to the Gemfile, you will need to run this command again.
7. Enter **ruby app.rb**, which should open a Gosu window that shows the game's welcome screen.

### Game Play
1. Click the space bar to enter the game.
2. Navigate your character through the game maze with using **h, j, k, l**, which are the VIM commands for left, down, up, and right, respectively.
3. Use **i** to collect dots or grab the bonus bunch of cherries.
4. To exit, press **esc** or **q**.

### Sources and Inspiration
Gosu guidance from https://guides.railsgirls.com/ruby-game

#### Audio
* honk-sound.mp3: https://www.myinstants.com/instant/goose-honk-44161/

* success-sound-effect.mp3: http://www.orangefreesounds.com/success-sound-effect/

* yoshi-ow.mp3: https://www.myinstants.com/instant/yoshi-ow/

* GHOSTLY.mp3: https://www.freesoundeffects.com/free-track/ghostly-466382/

* menu-screen.mp3: https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/Komiku/Captain_Glouglous_Incredible_Week_Soundtrack/Komiku_-_06_-_School.mp3 freemusicarchive.org licensing information: "The Free Music Archive offers free downloads under Creative Commons and other licenses."

* 8-punk-8-bit-music.mp3: http://www.orangefreesounds.com/8-punk-8-bit-music/ orangefreesounds.com licensing information: "The song is permitted for non-commercial use under license “Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)"

#### Graphics
* Goose was inspired by the Untitled Goose Game. Our sprite was drawn with piskelapp.com, using this sprite sheet as inspiration https://www.spriters-resource.com/custom_edited/untitledgoosegamecustoms/sheet/122248/.

### Known Issues and Limitations
* While not a bug per se, we have noticed variations in the order in which different game levels display depending on version of MacOS.

If something doesn't display correctly or goes wrong somehow, please contact us at  <drew.a.peterson@hotmail.com> <lara.m.bjork@gmail.com>, <mwells1286@gmail.com> and we will do our best to troubleshoot for you.

### Where to Find This Project
https://github.com/Michael-Wayne-Wells/vim-game.git

### License
This software is licensed under the MIT license.

Copyright (c) 2020 Celeste Morton, Drew Peterson, Lara Bjork, and Michael Wells
