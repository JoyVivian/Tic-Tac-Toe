module src.board;

import std.range;
import std.format;
import std.stdio;

/** 
 * This is the class for the current board.
 *
 */
class Board {
    char[9] cells = ['\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'];

    /** 
     * Get the string of current board status.
     *
     * Returns: The string of current board status
     */
    string display() {
        string first = format("%c | %c | %c \n", cells[0], cells[1], cells[2]);
        string separator = ("---------------\n");
        string second = format("%c | %c | %c \n", cells[3], cells[4], cells[5]);
        string third = format("%c | %c | %c \n", cells[6], cells[7], cells[8]);

        string total = first ~ separator ~ second ~ separator ~ third;
        
        return total;
    }


    /** 
     * Update a cell.
     * Params:
     *  - location: the index of the cell
     *  - mark: the mark to put into the cell.
     */
    void updateCell(int location, char mark) {
        if (location < 0 || location > 8) {
            throw new Exception("This location is illegal");
        }

        if (mark != 'X' && mark != 'O') {
            throw new Exception(format("mark parameter can only be X or O, but input is %c", mark));
        }

        if (is_valid(location)) {
            cells[location] = mark;
        } 
    }


    /** 
     * Check if there is a winner.
     *
     * Returns: the mark for the winner or ''.
     */
    char is_win() {
        if (check('X')) {
            return 'X';
        } 

        if (check('O')) {
            return 'O';
        }

        return '\0';
    }

    /** 
     * Check if the cirrent status is tie.
     *
     * Returns: A boolean representa whether it is tie or not.
     */
    bool is_tie() {
      if (!has_empty() && is_win() == '\0') {
        return true;
      } 

      return false;
    }

    bool has_empty() {
        for (int i = 0; i < cells.length; i++) {
            if (cells[i] == '\0') {
                return true;
            }
        }

        return false;
    }

    /** 
     * This is a helper method for `isWin()`.
     *
     * Params:
     *    - mark: the mark for the winner or ''.
     * Returns: If there is a winner, return the winner's mark; If not, return an empty cahracter.
     */
    private bool check(char mark) {
        if (mark != 'X' && mark != 'O') {
            throw new Exception(format("mark can only be X or O, but the input is: %c", mark));
        }

        // Check lines.
        for (int i = 0; i <= 6; i+=3) {
            if (cells[i+0] == mark && cells[i + 1] == mark && cells[i + 2] == mark) {
                return true;
            }
        }

        // Check columns.
        for (int i = 0; i <=2; i++) {
            if (cells[i+0] == mark && cells[i + 3] == mark && cells[i + 6] == mark) {
                return true;
            }
        }
        // Check diagonals.
        if ((cells[0] == mark && cells[4] == mark && cells[8] == mark)
        || (cells[2] == mark && cells[4] == mark && cells[6] == mark)) {
            return true;
        }

        return false;
    }
    
    /**
    * Params:
    *   - location: int represents the location to check.
    * Returns: If the location is valid, return true; Otherwise, return false.
    */
    public bool is_valid(int location) {
        if (location < 0 || location > 8) {
            throw new Exception("This location is illegal");
        }

        return cells[location] == '\0' ? true : false;
    }

    /**
    * Show instruction board to player to help them understand location.
    */
    public string show_instruction_board() {
        string first = "0 | 1 | 2 \n";
        string separator = "---------------\n";
        string second = "3 | 4 | 5 \n";
        string third = "6 | 7 | 8 \n";

        string total = first ~ separator ~ second ~ separator ~ third;
        
        return total;
    }
}



