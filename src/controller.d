module src.controller;

import std.stdio;
import std.format;

import src.game_model;
import src.board;
import random.random_factory;

/** 
 * This class manages players' inputs and control the workflow of this game.
 */
class Controller {
    void start_game(GameModel game_model, bool is_random) {
        
        
        // Genrate a number. `0` represents 'X' starts first. `1` represents `O` starts first.
        RandomFactory random_instance = new RandomFactory();
        int random_val = random_instance.create_random_instance(is_random).get_random_value();

        writeln(game_model.show_instruction_board());

        char turn = random_val == 0 ? 'X' : 'O';

        // While no winner and no tie, continue the game.
        writeln(game_model.is_win());
        while(game_model.is_win() == '\0' && !game_model.is_tie()) {
            writeln(format("Now it is %c's turn", turn));
            writeln("Please choose a location entering number 0-8 showed above:");

            writeln(game_model.display());

            int location = -1;

            readf("%d", &location);

            while (!game_model.is_valid(location)) {
                writeln("This location is invalid please enter another location.");
                readf("%d", &location);
            }

            game_model.play(location, turn);
            

            writeln(game_model.display());
        }

        // Has winner, prompt.
        if (!game_model.is_win) {
            writeln(format("%c  wins!", turn));
        }

        // Tie, prompt.
        if (game_model.is_tie) {
            writeln("This round is tie.");
        }
    } 
}
