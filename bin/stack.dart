class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  //E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Stack<E> Reverse() {
    final stack2 = Stack<E>();

    while (this.isNotEmpty) {
      var x = this.pop();
      stack2.push(x);
    }
    return stack2;
  }

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.join('\n')}'
        '\n-----------';
  }
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);

  var reverse = stack.Reverse();
  print(reverse);
}
////////////////////////////////////////////////////////////////