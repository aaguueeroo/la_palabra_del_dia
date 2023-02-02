# La palabra del dia

A new Flutter project to practice.

## Getting Started

This project is based on the [la palabra del dia](https://lapalabradeldia.com) website.

<img src="https://user-images.githubusercontent.com/95516694/216355977-fc283ef3-3405-47a7-a647-db1fb65e3346.png" width="300" height="600">

A player has to guess a word that is chosen randomly every time among a repository of words. They can input letters and these will change the color depending on if they are in the right position (green) or contained in the word (yellow).

I centered on the functioning rather than on the looks. It is a very basic version of the original application, with only the main play mode available. Once the user guesses the word, they are given the option to restart the game. 

Features I would add:
- Restrictions to be able to add only words that have an entry in the Spanish dictionary. I could not include this because I could not find an API to check the validity of the words.
- Animations when the user guesses a word: the tiles turn around and show new colors if that is the case.
- Improve UX: include main menu and an option to go back to it. Show a final view after user guesses the word with congratulations and statistics.
- Improve general design.
