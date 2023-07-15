import 'dart:ui';

enum Choose {
  rock(1, 'assets/images/rock.png', Color(0xff964B00)),
  paper(2, 'assets/images/paper.png', Color(0xffff0000)),
  scissors(3, 'assets/images/scissors.png', Color(0xff4CAF50));

  final int id;
  final String iconPath;
  final Color backgroundColor;

  const Choose(this.id, this.iconPath, this.backgroundColor);
}

extension ChooseExtension on Choose {
  bool? isWinnerInFightWith(Choose choose) {
    if (id - choose.id == 0) return null;
    if (id - choose.id == -2 || id - choose.id == 1) return true;
    return false;
  }
}
