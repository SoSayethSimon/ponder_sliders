class Aspect {
  final String name;

  double rating = 5.0; 

  Aspect(this.name);

  @override
  String toString() {
    return name + ": " + rating.toInt().toString();
  }
}