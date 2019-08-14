# カレントディレクトリを設定
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# TSVファイル読込＆create書込＆insert書込
sqlite3 :memory: \
".mode tabs" \
".import /tmp/work/Sqlite3.FileIO.20190814093254/src/points.tsv points" \
".output /tmp/work/Sqlite3.FileIO.20190814093254/src/points_create.sql" \
"select sql from sqlite_master;" \
".mode insert" \
".output /tmp/work/Sqlite3.FileIO.20190814093254/src/points_insert.sql" \
"select * from points;" \
".output /tmp/work/Sqlite3.FileIO.20190814093254/src/points_insert_type.sql" \
"select cast(id as int), name, cast(class as int), cast(point as int) from points;"

