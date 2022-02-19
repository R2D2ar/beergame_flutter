
import 'package:mysql1/mysql1.dart';

class Mysql{
  Future<String> connect() async {
    var list = List<String>;
    var settings = ConnectionSettings(
        host: 'localhost',//or the needed ip
        port: 3306,
        user: '',
        password: '',
        db: 'beergame'
    );
    var conn = await MySqlConnection.connect(settings);
    var userId = 1;
    var results = await conn.query('select name, email from users where id = ?', [userId]);
    return results.toString();
  }
}