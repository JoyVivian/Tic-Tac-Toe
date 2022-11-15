module src.board;

class Board {
    this() {
        char [9] cells;
    }

    string display() {

    }

    void updateCell(int location, char mark) {
        cells[location] = mark;
    }

    bool isWin() {

    }

    bool isTie() {

    }
}