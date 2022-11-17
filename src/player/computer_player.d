module player.computer_player;

import player.player;
import src.board;

class ComputerPlayer : Player
{
    char mark;

    this(char mark)
    {
        this.mark = mark;
    }

    public override void play(int location, Board board)
    {

    }
}
