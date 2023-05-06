


final Map<String, int> categories = {
  'Notes':112, 
  'Work':58,
  'Home':23,
  'Complete':31
};
class Note{
  late String title;
  late String content;
  DateTime date;

  Note({required this.title, required this.content, required this.date});

}

final List<Note> notes = [
Note(title: 'Buy ticket', 
content: 'buy airplane ticket through cheapoair for \$120.55', 
date: DateTime(2022, 5,10,8,30)),
Note(title: 'Walk with dog', 
content: 'Walk on the street with my dog', 
date: DateTime(2023,5,12,9,30))
];









