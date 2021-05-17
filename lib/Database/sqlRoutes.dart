import 'dart:async';
import 'package:yacguide_flutter/Database/sql.dart';

extension SqlHandlerRoutes on SqlHandler {
  FutureOr<int> deleteRoutes(int sektorid) async {
    return database.then(
      (db) => db.delete(
        'wege',
        where: 'sektorid = ?',
        whereArgs: [sektorid],
      ),
    );
  }

  Future<List<Map<String, Object?>>> queryRoutes(
    int gipfelid,
  ) async {
    return database.then((db) => db.query(
          'wege',
          columns: [
            'sektorid',
            'Weg_ID',
            'gipfelid',
            'schwierigkeit',
            'ringzahl',
            'wegbeschr_d',
            'wegbeschr_cz',
            'kletterei',
            'wegname_d',
            'wegname_cz',
            'wegstatus',
            'wegnr'
          ],
          where: 'gipfelid = ?',
          whereArgs: [gipfelid],
        ));
  }
}
