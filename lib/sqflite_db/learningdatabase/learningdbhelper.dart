import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'learningmodel.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final listType =  'LIST NOT NULL';

    await db.execute('''CREATE TABLE $tableNotes( 
        ${NoteFields.id} $idType, 
        ${NoteFields.teachername} $textType,
        ${NoteFields.observername} $textType,
        ${NoteFields.observerid} $textType,
        ${NoteFields.teacherid} $textType,
        ${NoteFields.subjectid} $textType,
        ${NoteFields.subjectname} $textType,
        ${NoteFields.schoolid} $textType,
        ${NoteFields.classid} $textType,
        ${NoteFields.classname} $textType,
        ${NoteFields.batchid} $textType,
        ${NoteFields.area} $textType,
        ${NoteFields.academicyear} $textType,
        ${NoteFields.strength} $textType,
        ${NoteFields.suggested} $textType,
        ${NoteFields.rol_ids} $textType,
        ${NoteFields.upper_hierrarchy} $textType,
        ${NoteFields.session_id} $textType,
        ${NoteFields.curriculum_id} $textType,
        ${NoteFields.isJoin} $textType,
        ${NoteFields.tempname} $textType
  )''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    //final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete() async {
    final db = await instance.database;
    return await db.delete(tableNotes);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
