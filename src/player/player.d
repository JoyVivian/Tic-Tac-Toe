module player.player;

import src.board;

interface Player {
    void play(int location, Board board);
}
