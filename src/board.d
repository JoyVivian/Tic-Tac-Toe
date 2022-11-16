module src.board;

import std.range;
import std.format;

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
     * Returns: If the update is successful, return true; Otherwise, return true.
     */
    bool updateCell(int location, char mark) {
        if (cells[location] == '\0') {
            cells[location] = mark;
            return true;
        } 

        return false;  
    }


    /** 
     * Check if there is a winner.
     *
     * Returns: the mark for the winner or ''.
     */
    char isWin() {
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
    bool isTie() {
      if (!cells.empty && isWin == '\0') {
        return true;
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
    private char check(char mark) {
        // Check lines.
        for (int i = 0; i <= 6; i+=3) {
            if (cells[i+0] == cells[i + 1] && cells[i+ 0] == cells[i + 2]) {
                return mark;
            }
        }

        // Check columns.
        for (int i = 0; i <=2; i++) {
            if (cells[i+0] == cells[i + 3] && cells[i + 3] == cells[i + 6]) {
                return mark;
            }
        }
        // Check diagonals.
        if ((cells[0] == cells[4] && cells[4] == cells[8] )
        || (cells[2] == cells[4] && cells[4] == cells[6])) {
            return mark;
        }

        return '\0';
    }
}



