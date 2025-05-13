import 'dart:io';

void main() {
  print('Tic-Tac-Toe Game');
  print('----------------');

  while (true) {
    List<String> cells = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String turn = 'X';
    bool end = false;

    void showBoard() {
      print('\nBoard now:');
      print('${cells[0]} | ${cells[1]} | ${cells[2]}');
      print('---------');
      print('${cells[3]} | ${cells[4]} | ${cells[5]}');
      print('---------');
      print('${cells[6]} | ${cells[7]} | ${cells[8]}');
    }

    bool pickCell() {
      print('\n$turn\'s turn. Pick a number 1-9:');
      String? choice = stdin.readLineSync();

      if (choice == null || int.tryParse(choice) == null) {
        print('That\'s not a number.');
        return false;
      }

      int pos = int.parse(choice) - 1;

      if (pos < 0 || pos > 8) {
        print('Number out of range.');
        return false;
      }

      if (cells[pos] == 'X' || cells[pos] == 'O') {
        print('Used spot. Try something else.');
        return false;
      }

      cells[pos] = turn;
      return true;
    }

    bool didWin() {
      List<List<int>> wins = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ];

      for (var line in wins) {
        if (cells[line[0]] == turn &&
            cells[line[1]] == turn &&
            cells[line[2]] == turn) {
          return true;
        }
      }

      return false;
    }

    bool noMovesLeft() {
      return cells.every((c) => c == 'X' || c == 'O');
    }

    while (!end) {
      showBoard();
      bool okay = false;
      while (!okay) {
        okay = pickCell();
      }

      if (didWin()) {
        showBoard();
        print('\n$turn wins!');
        end = true;
      } else if (noMovesLeft()) {
        showBoard();
        print('\nDraw.');
        end = true;
      } else {
        turn = turn == 'X' ? 'O' : 'X';
      }
    }

    print('\nPlay again? y/n');
    String? again = stdin.readLineSync();
    if (again == null || again.toLowerCase() != 'y') {
      break;
    }
  }

  print('Game over.');
}
