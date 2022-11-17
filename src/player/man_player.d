module player.man_player;

import player.player;
import src.board;

class ManPlayer : Player
{
    char mark;

    this(char mark)
    {
        this.mark = mark;
    }

    public override void play(int location, Board board)
    {
        board.updateCell(location, mark);
    }
}
