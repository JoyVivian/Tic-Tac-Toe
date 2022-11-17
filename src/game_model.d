module src.game_model;

import player.player;
import player.player_factory;

import src.board;

class GameModel {
    Player player_x;
    Player player_o;
    Board board;

    this(bool is_computer) {
        PlayerFactory player_factory = new PlayerFactory();
        player_x = player_factory.get_player(is_computer, 'X');
        player_o = player_factory.get_player(false, 'O');
        
        board = new Board();
    }

    char is_win() {
        return board.is_win();
    }

    bool is_tie() {
        return board.is_tie();
    }

    bool is_valid(int location) {
       return board.is_valid(location); 
    }

    string show_instruction_board() {
        return board.show_instruction_board();
    }

    void play(int location, char mark) {
        if (mark == 'X') {
            player_x.play(location, board);
        }
    }

    string display() {
        return board.display();
    }
}

